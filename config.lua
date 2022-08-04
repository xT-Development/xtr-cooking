Config = {}
Config.DebugPoly = false -- Enable debug for placed campfires
Config.Radial = false -- Set to true to use radial menu near cooking objects

----- FAILED REP -----
Config.RemoveRepChance = 30 -- When failing skill check, 1-100 chance to ruin food. If random chance is under this, it will remove rep
Config.RemoveRepAmount = 1 -- Amount of rep removed if failed to cook and over random chance

----- CAMPFIRE BURNOUT TIME -----
Config.CampfireOut = 5 -- Set in MINUTES. How long until campfire goes out. Prevents too many fires from being spawned.
Config.StokeFire = 1 -- Set in MINUTES. How much time is added to campfire until burnout when stoking the fire.

----- PROGRESSBAR TIMES -----
Config.TimetoPlace = 5 -- Set in SECONDS. How long it takes to place a campfire
Config.TimetoStoke = 7 -- Set in SECONDS. How long it takes to stoke the fire
Config.TimetoPutOut = 5 -- Set in SECONDS. How long it takes to put out the fire
Config.TimetoSkin = 5 -- Set in SECONDS. How long it takes to skin a fish

----- MINIGAME -----
Config.Circles = 3 -- How many times required to complete minigame
Config.CircleTime = 10 -- How long each circle is

-------------------------------------
---------- COOKING OBJECTS ----------
-------------------------------------

-- ONLY USED WHEN Config.Radial IS TRUE --
Config.CookingObjects = {
	"p_campfirecombined01x",
	"p_campfirecombined02x",
	"p_campfirecombined03x",
	"p_campfirecombined04x",
	"s_cookfire01x",
	"p_stove06x",
	"p_stove07x"
}

--------------------------------------
------------ COOKING ITEMS -----------
--------------------------------------
Config.CookingItems = {

    ["Cooked Fish"] = {
        reqrep = 0,
        addrep = 1,
        cooktime = 5000,
        materials = {
            [1] = {
               item = "fishmeat",
               amount = 1
            },
        },
        receive = "cooked_fishmeat"
    },

    ["Cooked Meat"] = {
        reqrep = 0,
        addrep = 1,
        cooktime = 5000,
        materials = {
            [1] = {
               item = "raw_meat",
               amount = 1
            },
        },
        receive = "cooked_meat"
    },
}



-------------------------------------------------
---------------- DON'T TOUCH --------------------
-------------------------------------------------
Config.Fish = {
    [1] = {
        name = 'Blue Gill',
        type =  bluegills,
        fish = {
            [1] = 'a_c_fishbluegil_01_ms',
            [2] = 'a_c_fishbluegil_01_sm',
        }
    },
    [2] = {
        name = 'Bullhead Cat',
        type =  bullheadcat,
        fish = {
            [1] = 'a_c_fishbullheadcat_01_ms',
            [2] = 'a_c_fishbullheadcat_01_sm',
        }
    },
    [3] = {
        name = 'Chain Pickerel',
        type =  chainpickerel,
        fish = {
            [1] = 'a_c_fishchainpickerel_01_ms',
            [2] = 'a_c_fishchainpickerel_01_sm',
        }
    },
    [4] = {
        name = 'Channel Catfish',
        type =  channelcatfish,
        fish = {
            [1] = 'a_c_fishchannelcatfish_01_lg',
            [2] = 'a_c_fishchannelcatfish_01_xl',
        }
    },
    [5] = {
        name = 'Lake Sturgeon',
        type =  lakesturgeon,
        fish = {
            [1] = 'a_c_fishlakesturgeon_01_lg',
        }
    },
    [6] = {
        name = 'Large Mouth Bass',
        type =  largemouthbass,
        fish = {
            [1] = 'a_c_fishlargemouthbass_01_lg',
            [2] = 'a_c_fishlargemouthbass_01_ms',
        }
    },
    [7] = {
        name = 'Long Nose Gar',
        type =  longnosegar,
        fish = {
            [1] = 'a_c_fishlongnosegar_01_lg',
        }
    },
    [8] = {
        name = 'Muskie',
        type =  muskie,
        fish = {
            [1] = 'a_c_fishmuskie_01_lg',
        }
    },
    [9] = {
        name = 'Northern Pike',
        type =  northernpike,
        fish = {
            [1] = 'a_c_fishnorthernpike_01_lg',
        }
    },
    [10] = {
        name = 'Perch',
        type =  perch,
        fish = {
            [1] = 'a_c_fishperch_01_ms',
            [2] = 'a_c_fishperch_01_sm',
        }
    },
    [11] = {
        name = 'Rainbow Trout',
        type =  rainbowtrout,
        fish = {
            [1] = 'a_c_fishrainbowtrout_01_lg',
            [2] = 'a_c_fishrainbowtrout_01_ms',
        }
    },
    [12] = {
        name = 'Red Fin Pickerel',
        type =  redfinpickerel,
        fish = {
            [1] = 'a_c_fishredfinpickerel_01_ms',
            [2] = 'a_c_fishredfinpickerel_01_sm',
        }
    },
    [13] = {
        name = 'Salmon Sockeye',
        type =  monosockeye,
        fish = {
            [1] = 'a_c_fishrockbass_01_ms',
            [2] = 'a_c_fishrockbass_01_sm',
        }
    },
    [14] = {
        name = 'Small Mouth Bass',
        type =  smallmouthbass,
        fish = {
            [1] = 'a_c_fishsmallmouthbass_01_lg',
            [2] = 'a_c_fishsmallmouthbass_01_ms'
        }
    },
    [15] = {
        name = 'Rock Bass',
        type =  rockbass,
        fish = {
            [1] = 'a_c_fishrockbass_01_ms',
            [2] = 'a_c_fishrockbass_01_sm',
        }
    },
}