QBCore = {}
local sharedItems = exports['qbr-core']:GetItems()

---------------------
-- COOKING ITEMS --
---------------------

-- GET COOKED ITEM --
RegisterNetEvent('xt-cooking:server:GetCookedItem', function(item, addrep)
    local src = source
    local Player = exports['qbr-core']:GetPlayer(src)

    Player.Functions.AddItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, sharedItems[item], 'add', 1)

    local cookingRep = Player.PlayerData.metadata['cookingrep'] + addrep
    if cookingRep <= 0 then
        cookingRep = 0
    end
    Player.Functions.SetMetaData('cookingrep', cookingRep)
end)

-- FAILED COOK : REMOVE REP --
RegisterNetEvent('xt-cooking:server:RemoveRep', function()
    local src = source
    local Player = exports['qbr-core']:GetPlayer(src)
    local cookingRep = Player.PlayerData.metadata['cookingrep'] - Config.RemoveRepAmount
    if cookingRep <= 0 then
        cookingRep = 0
    end
    Player.Functions.SetMetaData('cookingrep', cookingRep)
end)

-- CHECK FOR MATERIALS --
exports['qbr-core']:CreateCallback('xt-cooking:server:CookingMaterials', function(source, cb, materials, reqRep)
    local src = source
    local hasItems = false
    local idk = 0
    local Player = exports['qbr-core']:GetPlayer(src)
    if Player.PlayerData.metadata['cookingrep'] >= reqRep then -- Check Cooking Reputation
        for k, v in pairs(materials) do
            if Player.Functions.GetItemByName(v.item) and Player.Functions.GetItemByName(v.item).amount >= v.amount then -- Check for materials
                idk = idk + 1
                if idk == #materials then
                    cb(true)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 9, 'You don\'t have the required items!', 5000, 0, 'hud_textures', 'cross', 'COLOR_RED')
                cb(false)
                return
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 9, 'You don\'t have the required cooking reputation: '..reqRep, 5000, 0, 'hud_textures', 'cross', 'COLOR_RED')
    end
end)

-----------------------------------------------------------------------
----------------------------- ITEMS -----------------------------------
exports['qbr-core']:CreateUseableItem("campfire", function(source, item)
	local Player = exports['qbr-core']:GetPlayer(source)
    TriggerClientEvent("xt-cooking:client:CampFire", source, item.name)
end)

RegisterNetEvent('xt-cooking:RemoveCampfire', function()
    local src = source
    local Player = exports['qbr-core']:GetPlayer(src)
    Player.Functions.RemoveItem('campfire', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, sharedItems['campfire'], 'remove', 1)
end)

-----------------------------------------------------------------------
--------------------------- COMMANDS ----------------------------------
exports['qbr-core']:AddCommand('setcookingrep', 'Set Cooking Rep (Admin Only)', {{name = "id", help = "Player ID"},{ name = 'rep', help = 'Reputation Amount' }}, false, function(source, args)
	local src = source
    local Player = exports['qbr-core']:GetPlayer(tonumber(args[1]))
    if Player then
        Player.Functions.SetMetaData('cookingrep', tonumber(args[2]))

        TriggerClientEvent('QBCore:Notify', src, 9, Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.." Cooking Rep Set to: "..tonumber(args[2]), 5000, 0, 'mp_lobby_textures', 'check', 'COLOR_WHITE')
    else
        TriggerClientEvent('QBCore:Notify', src, 9, "Player is not online!", 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_RED')
    end
end, 'admin')