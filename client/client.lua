QBCore = {}
local sharedItems = exports['qbr-core']:GetItems()
local sleep = 1000
local Campfire = 0
local cook = 0
local zonename = {}
local TimeUntilBurnout = Config.CampfireOut
local name = {}
----------------------------------------------------
----------------------------------------------------
-- TARGET FOR PLACED CAMPFIRES --
RegisterNetEvent('xt-cooking:CampfireTarget', function()
  local pos = GetEntityCoords(PlayerPedId())
  local cookingObject = GetClosestObjectOfType(pos, 0.7, GetHashKey('p_campfire05x'), false, false, false)
  if cookingObject ~= 0 then
    local objectPos = GetEntityCoords(cookingObject)
    name = exports['qbr-core']:RandomStr(5) -- Creates Random String for Zone Name

    exports['qbr-target']:AddCircleZone(name, objectPos, 0.5, {
      name = name,
      debugPoly = Config.DebugPoly,
    }, {
      options = {
        {
          type = "client",
          event = "xt-cooking:MainMenu",
          icon = "fas fa-fire",
          label = "Cook Food",
        },
        {
          type = "client",
          event = "xt-cooking:RemoveCampfire",
          icon = "fas fa-fire",
          label = "Put Out Fire",
        },
        {
          type = "client",
          event = "xt-cooking:StokeFire",
          icon = "fas fa-fire",
          label = "Stoke the Fire",
        }
      },
      distance = 2.0,
    })
  end
end)

-------------------------------
------- RADIAL MENU -----------
-------------------------------

if Config.Radial then
  local function RemoveCookingOption()
    if CookingTab then
      exports['qbr-radialmenu']:RemoveOption(CookingTab)
      CookingTab = nil
    else
      Wait(sleep)
    end
  end

  local function AddCookingOption()
    if not CookingTab then
      CookingTab = exports['qbr-radialmenu']:AddOption({
        id = 'cook',
        title = 'Cooking',
        icon = 'fire',
        type = 'client',
        event = 'xt-cooking:MainMenu',
        shouldClose = true
      })
    else
      Wait(sleep)
    end
  end
end

-------------------------------
-------- COOKING EVENTS -------
-------------------------------

local function CookFood(item, cooktime)
  local randomchance = math.random(1, 100)

  TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_FIRE_TEND_KNEEL'), -1, true, false, false, false)
  Wait(3000) -- Wait for animation

  local success = exports['qbr-lock']:StartLockPickCircle( Config.Circles, Config.CircleTime )
  if success then
    exports['qbr-core']:Progressbar('cooking_item', "Cooking "..item, tonumber(cooktime), false, false, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function() -- Success
      exports['qbr-core']:Notify(9, 'Cooked: '..item, 5000, 0, 'mp_lobby_textures', 'check', 'COLOR_WHITE')
      TriggerServerEvent('xt-cooking:server:GetCookedItem', Config.CookingItems[item].receive, Config.CookingItems[item].addrep)
      for k, v in pairs(Config.CookingItems[item].materials) do
        TriggerServerEvent('QBCore:Server:RemoveItem', v.item, v.amount)
        TriggerEvent("inventory:client:ItemBox", sharedItems[v.item], "remove")
      end
      TriggerEvent('animations:client:EmoteCommandStart', {"c"})
      ClearPedTasks(PlayerPedId())
    end, function() -- Cancel
      ClearPedTasks(PlayerPedId())
      exports['qbr-core']:Notify(9, 'Canceled!', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_RED')
    end)
  else
    exports['qbr-core']:Notify(9, 'You burnt the food!', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_RED')
    -- REMOVE MATERIALS --
    for k, v in pairs(Config.CookingItems[item].materials) do
      TriggerServerEvent('QBCore:Server:RemoveItem', v.item, v.amount)
      TriggerEvent("inventory:client:ItemBox", sharedItems[v.item], "remove")
    end
    -- REMOVE REP RANDOMLY --
    if randomchance <= Config.RemoveRepChance then
      TriggerServerEvent('xt-cooking:server:RemoveRep', true)
    end
  end
end

-- USES CALLBACK FOR ITEMS --
RegisterNetEvent('xt-cooking:CookFood', function(data)
  exports['qbr-core']:TriggerCallback("xt-cooking:server:CookingMaterials", function(hasRequired)
    if (hasRequired) then
      CookFood(data.item, tonumber(data.cooktime))
    else
      exports['qbr-core']:Notify(9, 'You don\'t have the required items!', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_RED')
      return
    end
  end, Config.CookingItems[data.item].materials, Config.CookingItems[data.item].reqrep)
end)

----------------------------------------------------
------------------------ THREADS ------------------
---------------------------------------------------
-- CHECK IF CITIZEN IS NEAR FIRE OR COOKING POT --
if Config.Radial then
  CreateThread(function()
    while true do
      Wait(1)
      local pos, awayFromObject = GetEntityCoords(PlayerPedId()), true
      for _,v in pairs(Config.CookingObjects) do
        Object = GetClosestObjectOfType(pos, 5.0, GetHashKey(v), false, false, false)
        if Object ~= 0 then
          local objectPos = GetEntityCoords(Object)
          if #(pos - objectPos) < 3.0 then
            awayFromObject = false
            AddCookingOption()
          else
            RemoveCookingOption()
          end
        end
      end

      if awayFromObject then
        Wait(sleep)
      end
    end
  end)
end

-- IF CAMPFIRE PLACED, START TIMER UNTL BURNOUT --
if Campfire ~= 0 then
  CreateThread(function()
    while true do
      Wait(60000) -- Updates Time Every Minute
      if TimeUntilBurnout > 0 then
        TimeUntilBurnout -= 1
        if TimeUntilBurnout <= 0 then
          TriggerEvent('xt-cooking:CampfireBurnout')
          Campfire = 0
        end
      end
    end
  end)
else
  Wait(sleep)
end

----------------------------------------------------
---------------------- EVENTS ----------------------
----------------------------------------------------
RegisterNetEvent("xt-cooking:SkinFish", function(data)
	exports['qbr-core']:TriggerCallback('QBCore:HasItem', function(hasItem)
		if hasItem then
      local playerPed = PlayerPedId()
      TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 20000, true, false, false, false)
      Wait(3000) -- Wait for animation

			exports['qbr-core']:Progressbar("skin_fish", "Skinning Fish..", (Config.TimetoSkin * 1000), false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
        ClearPedTasks(playerPed)
				TriggerServerEvent('QBCore:Server:RemoveItem', data.required, 1)
				TriggerEvent("inventory:client:ItemBox", sharedItems[data.required], "remove")
				TriggerServerEvent('QBCore:Server:AddItem', data.item, 1)
				TriggerEvent("inventory:client:ItemBox", sharedItems[data.item], "add")
				exports['qbr-core']:Notify(9, 'Fish meat is ready to be cooked!', 5000, 0, 'inventory_items', 'provision_fish_meat', 'COLOR_WHITE')
			end)
		end
	end, { [data.required] = 1, ["WEAPON_MELEE_KNIFE"] = 1 })
end)

----------------------------------------------------
----------------- REMOVE CAMPFIRES -----------------
----------------------------------------------------
RegisterNetEvent("xt-cooking:RemoveCampfire", function()
  local playerPed = PlayerPedId()
  local pos = GetEntityCoords(playerPed)
  Object = GetClosestObjectOfType(pos, 5.0, GetHashKey('p_campfire05x'), false, false, false)
  Object2 = GetClosestObjectOfType(pos, 5.0, GetHashKey('p_cookgrate01x'), false, false, false)
  if Object ~= 0 and Object2 ~= 0 then
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_FIRE_TEND_KNEEL'), 20000, true, false, false, false)
    Wait(3000) -- Wait for animation

    exports['qbr-core']:Progressbar("put_out_fire", "Putting Out the Fire..", (Config.TimetoPutOut * 1000), false, true, {
      disableMovement = true,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function() -- Done
      ClearPedTasks(playerPed)
      SetEntityAsMissionEntity(Object)
      DeleteObject(Object)
      SetEntityAsMissionEntity(Object2)
      DeleteObject(Object2)
      exports['qbr-target']:RemoveZone(name)
      campfire = 0
    end)
  end
end)

RegisterNetEvent("xt-cooking:CampfireBurnout", function(data)
  if Campfire ~= 0 then
    exports['qbr-core']:Notify(9, 'Your campfire went out!', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_RED')
    SetEntityAsMissionEntity(prop)
    DeleteObject(prop)
    SetEntityAsMissionEntity(prop2)
    DeleteObject(prop2)
    exports['qbr-target']:RemoveZone(name)
    campfire = 0
  end
end)

----------------------------------------------------
-------------------- STOKE FIRE --------------------
----------------------------------------------------
RegisterNetEvent("xt-cooking:StokeFire", function()
  local playerPed = PlayerPedId()
  local pos = GetEntityCoords(playerPed)
  Object = GetClosestObjectOfType(pos, 5.0, GetHashKey('p_campfire05x'), false, false, false)
  Object2 = GetClosestObjectOfType(pos, 5.0, GetHashKey('p_cookgrate01x'), false, false, false)
  if Object ~= 0 and Object2 ~= 0 then
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_FIRE_TEND_KNEEL'), 20000, true, false, false, false)
    exports['qbr-core']:Progressbar("stoke_fire", "Stoking the Fire..", (Config.TimetoStoke * 1000), false, true, {
      disableMovement = true,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function() -- Done
      exports['qbr-core']:Notify(9, 'You stoked the fire!', 5000, 0, 'mp_lobby_textures', 'check', 'COLOR_WHITE')
      TimeUntilBurnout = TimeUntilBurnout + Config.StokeFire -- Adds time when stoked
    end)
  end
end)

----------------------------------------------------
-------------- COOKING ITEMS -----------------------
----------------------------------------------------
RegisterNetEvent('xt-cooking:client:CampFire', function(itemName)
  if campfire == 0 then
		local playerPed = PlayerPedId()
		TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
    Wait(3000) -- Wait for animation

    exports['qbr-core']:Progressbar("stoke_fire", "Placing Campfire..", (Config.TimetoPlace * 1000), false, true, {
      disableMovement = true,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function() -- Done
      ClearPedTasksImmediately(PlayerPedId())
      local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.75, -1.55))
      prop = CreateObject(GetHashKey("p_campfire05x"), x, y, z, true, false, true)
      prop2 = CreateObject(GetHashKey("p_cookgrate01x"), x, y, z, true, false, true)
      SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
      SetEntityHeading(prop2, GetEntityHeading(PlayerPedId()))
      PlaceObjectOnGroundProperly(prop)
      PlaceObjectOnGroundProperly(prop2)
      campfire = prop
      cookgrill = prop2

      TriggerServerEvent('xt-cooking:RemoveCampfire')
      TriggerEvent('xt-cooking:CampfireTarget')
    end)
  else
    exports['qbr-core']:Notify(9, 'You already have a fire placed!', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_RED')
	end
end, false)

-------------------------------------------
---------- RESOURCE START / STOP ----------
-------------------------------------------
AddEventHandler('QBCore:Client:OnPlayerloaded', function()
  TriggerEvent('xt-cooking:CampfireBurnout')
  Campfire = 0
  TimeUntilBurnout = Config.CampfireOut
end)
AddEventHandler('QBCore:Client:OnPlayerUnloaded', function()
  TriggerEvent('xt-cooking:CampfireBurnout')
  Campfire = 0
  TimeUntilBurnout = 0
end)
AddEventHandler('onResourceStart', function(resourceName)
  if GetCurrentResourceName() == resourceName then
    Campfire = 0
    TimeUntilBurnout = Config.CampfireOut
  end
end)
AddEventHandler('onResourceStop', function(resourceName)
  if GetCurrentResourceName() == resourceName then
    Campfire = 0
    TimeUntilBurnout = 0
  end
end)
