local sharedItems = exports['qbr-core']:GetItems()
local campfire = 0
local sleep = 1000
CookingTab = nil

------------------------------------------------------
------------------- MAIN MENU ------------------------
------------------------------------------------------
RegisterNetEvent('xt-cooking:MainMenu', function()

    mainMenu = {
        {
            header = "| Cooking Menu |",
            isMenuHeader = true,
        },
        {
            header = "Cook Food",
            txt = "Open Cooking Menu",
            params = {
                event = "xt-cooking:CookingMenu",
            }
        },
        {
            header = "Skin Fish",
            txt = "",
            params = {
                event = "xt-cooking:SkinFishMenu",
            }
        },
        {
            header = "❌ | Close Menu",
            txt = '',
            params = {
            event = 'qbr-menu:closeMenu',
            }
        },
    }

    exports['qbr-menu']:openMenu(mainMenu)
end)

------------------------------------------------------
------------------- COOKING MENU ---------------------
------------------------------------------------------
RegisterNetEvent('xt-cooking:CookingMenu', function()

    cookingMenu = {}
    cookingMenu = {
        {
            header = "| Cooking Menu |",
            isMenuHeader = true,
        },
    }

    for k, v in pairs(Config.CookingItems) do
        print(k, v, v.cooktime)
        local item = {}
        local text = ""
        for k, v in pairs(v.materials) do
            text = text .. "- " .. sharedItems[v.item].label .. ": " .. v.amount .. "x <br>"
        end
        cookingMenu[#cookingMenu + 1] = {
            header = k,
            txt = text,
            params = {
                event = 'xt-cooking:CookFood',
                args = {
                    item = k,
                    cooktime = v.cooktime
                }
            }
        }
    end

    cookingMenu[#cookingMenu + 1] = {
        header = "⬅️ | Go Back",
        txt = '',
        params = {
            event = 'xt-cooking:MainMenu',
        }
    }

    cookingMenu[#cookingMenu + 1] = {
        header = "❌ | Close Menu",
        txt = '',
        params = {
            event = 'qbr-menu:closeMenu',
        }
    }

    exports['qbr-menu']:openMenu(cookingMenu)
end)

------------------------------------------------------
------------------- FISH MENU ------------------------
------------------------------------------------------
RegisterNetEvent('xt-cooking:SkinFishMenu', function(data)
    skinningmenu = {}
    skinningmenu = {
        {
            header = "| Skin Fish |",
            isMenuHeader = true
        }
    }

    for k,v in pairs(Config.Fish) do
        skinningmenu[#skinningmenu + 1] = {
            header = Config.Fish[k].name,
            txt = '',
            params = {
                event = 'xt-cooking:ChooseFish',
                args = {
                    fish = Config.Fish[k].fish,
                    lastpage = data
                }
            }
        }
    end

    skinningmenu[#skinningmenu + 1] = {
        header = "⬅️ | Go Back",
        txt = '',
        params = {
            event = 'xt-cooking:MainMenu',
        }
    }

    skinningmenu[#skinningmenu + 1] = {
        header = "❌ | Close Menu",
        txt = '',
        params = {
            event = 'qbr-menu:closeMenu',
        }
    }

    exports['qbr-menu']:openMenu(skinningmenu)
end)

RegisterNetEvent('xt-cooking:ChooseFish', function(data)

    choosefishmenu = {}
    choosefishmenu[#choosefishmenu + 1] = {
      isHeader = true,
      header = "| Fish Menu |",
      isMenuHeader = true,
      icon = ''
    }

    for k, v in pairs(data.fish) do
        print(k,v)
        choosefishmenu[#choosefishmenu + 1] = {
            header = "Skin "..sharedItems[v].label,
            txt = "",
            params = {
                event = "xt-cooking:SkinFish",
                args = {
                    required = sharedItems[v].name,
                    item = "fishmeat"
                }
            }
        }
    end

    choosefishmenu[#choosefishmenu + 1] = {
        header = "⬅️ | Go Back",
        txt = "",
        params = {
            event = "xt-cooking:SkinFishMenu",
            args = data.lastpage
        }
    }

    choosefishmenu[#choosefishmenu + 1] = {
        header = "❌ | Close Menu",
        txt = '',
        params = {
            event = 'qbr-menu:closeMenu',
        }
    }

    exports['qbr-menu']:openMenu(choosefishmenu)
end)