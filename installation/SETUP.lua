# Installation:
- Add items to shared/items.lua
- Add item images to qbr-inventory/html/images
- Add rep to qbr-core/server/player.lua:

PlayerData.metadata['cookingrep'] = PlayerData.metadata['cookingrep'] or 0

- Add to qbr-target config:
["cookingobjects"] = {
	models = {
		"p_campfire05x",
		"p_campfirecombined01x",
		"p_campfirecombined02x",
		"p_campfirecombined03x",
		"p_campfirecombined04x",
		"s_campfire01_fresh",
		"p_campfirefresh01x",
		"p_campfire02x_script",
		"s_mil_cookfire01x",
		"s_cookfire01x",
		"p_stove06x",
		"p_stove07x",
		"p_kettle01x",
		"p_cs_kettle01x",
		"p_kettle03x"
	},
	options = {
		{
			type = "client",
			event = "xt-cooking:MainMenu",
			icon = "fas fa-fire",
			label = "Cook Food",
		}
	},
	distance = 3.0
},


---------------------------------------------------------------
---------------------------- ITEMS LIST -----------------------
---------------------------------------------------------------
	["raw_meat"]							= {["name"] = "raw_meat",						["label"] = "Raw Meat",						["weight"] = 50, 	["type"] = "item",	["image"] = "raw_meat.png",								['unique'] = false,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	["description"] = "Raw Meat"},
	["cooked_meat"]							= {["name"] = "cooked_meat",					["label"] = "Cooked Meat",					["weight"] = 50, 	["type"] = "item",	["image"] = "cooked_meat.png",							['unique'] = false,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	["description"] = "Cooked Meat"},
	["fishmeat"]							= {["name"] = "fishmeat",						["label"] = "Raw Fish Meat",				["weight"] = 50, 	["type"] = "item",	["image"] = "fish_meat.png",							['unique'] = false,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	["description"] = "Raw Fish Meat"},
	["cooked_fishmeat"]						= {["name"] = "cooked_fishmeat",				["label"] = "Cooked Fish Meat",				["weight"] = 50, 	["type"] = "item",	["image"] = "cooked_fishmeat.png",						['unique'] = false,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	["description"] = "Cooked Fish Meat"},
	["campfire"]							= {["name"] = "campfire",						["label"] = "Campfire",						["weight"] = 500, 	["type"] = "item",	["image"] = "campfire.png",								['unique'] = false,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	["description"] = ""},

	['a_c_fishbluegil_01_ms']				= {['name'] = 'a_c_fishbluegil_01_ms',			['label'] = 'Blue Gil (Medium)',			['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishbluegil_01_ms.png',				['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishbluegil_01_sm']				= {['name'] = 'a_c_fishbluegil_01_sm',			['label'] = 'Blue Gil (Small)',				['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishbluegil_01_sm.png',				['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishbullheadcat_01_ms']			= {['name'] = 'a_c_fishbullheadcat_01_ms',		['label'] = 'Bullhead Cat (Medium)',		['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishbullheadcat_01_ms.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishbullheadcat_01_sm']			= {['name'] = 'a_c_fishbullheadcat_01_sm',		['label'] = 'Bullhead Cat (Small)',			['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishbullheadcat_01_sm.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishchainpickerel_01_ms']			= {['name'] = 'a_c_fishchainpickerel_01_ms',	['label'] = 'Chain Pickerel (Medium)',		['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishchainpickerel_01_ms.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishchainpickerel_01_sm']			= {['name'] = 'a_c_fishchainpickerel_01_sm',	['label'] = 'Chain Pickerel (Small)',		['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishchainpickerel_01_sm.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishchannelcatfish_01_lg']		= {['name'] = 'a_c_fishchannelcatfish_01_lg',	['label'] = 'Channel Catfish (Large)',		['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishchannelcatfish_01_lg.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishchannelcatfish_01_xl']		= {['name'] = 'a_c_fishchannelcatfish_01_xl',	['label'] = 'Channel Catfish (Extra Large)',['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishchannelcatfish_01_xl.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishlakesturgeon_01_lg']			= {['name'] = 'a_c_fishlakesturgeon_01_lg',		['label'] = 'Lake Sturgeon (Large)',		['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishlakesturgeon_01_lg.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishlargemouthbass_01_lg']		= {['name'] = 'a_c_fishlargemouthbass_01_lg',	['label'] = 'Large Mouth Bass (Large)',		['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishlargemouthbass_01_lg.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishlargemouthbass_01_ms']		= {['name'] = 'a_c_fishlargemouthbass_01_ms',	['label'] = 'Large Mouth Bass (Medium)',	['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishlargemouthbass_01_ms.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishlongnosegar_01_lg']			= {['name'] = 'a_c_fishlongnosegar_01_lg',		['label'] = 'Long Nose Gar (Large)',		['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishlongnosegar_01_lg.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishmuskie_01_lg']				= {['name'] = 'a_c_fishmuskie_01_lg',			['label'] = 'Muskie (Large)',				['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishmuskie_01_lg.png',					['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishnorthernpike_01_lg']			= {['name'] = 'a_c_fishnorthernpike_01_lg',		['label'] = 'Northern Pike (Large)',		['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishnorthernpike_01_lg.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishperch_01_ms']					= {['name'] = 'a_c_fishperch_01_ms',			['label'] = 'Perch (Medium)',				['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishperch_01_ms.png',					['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishperch_01_sm']					= {['name'] = 'a_c_fishperch_01_sm',			['label'] = 'Perch (Small)',				['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishperch_01_sm.png',					['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishrainbowtrout_01_lg']			= {['name'] = 'a_c_fishrainbowtrout_01_lg',		['label'] = 'Rainbow Trout (Large)',		['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishrainbowtrout_01_lg.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishrainbowtrout_01_ms']			= {['name'] = 'a_c_fishrainbowtrout_01_ms',		['label'] = 'Rainbow Trout (Medium)',		['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishrainbowtrout_01_ms.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishredfinpickerel_01_ms']		= {['name'] = 'a_c_fishredfinpickerel_01_ms',	['label'] = 'Red Fin Pickerel (Medium)',	['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishredfinpickerel_01_ms.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishredfinpickerel_01_sm']		= {['name'] = 'a_c_fishredfinpickerel_01_sm',	['label'] = 'Red Fin Pickerel (Small)',		['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishredfinpickerel_01_sm.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishrockbass_01_ms']				= {['name'] = 'a_c_fishrockbass_01_ms',			['label'] = 'Rock Bass (Medium)',			['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishrockbass_01_ms.png',				['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishrockbass_01_sm']				= {['name'] = 'a_c_fishrockbass_01_sm',			['label'] = 'Rock Bass (Small)',			['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishrockbass_01_sm.png',				['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishsalmonsockeye_01_lg']			= {['name'] = 'a_c_fishsalmonsockeye_01_lg',	['label'] = 'Salmon Sockeye (Large)',		['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishsalmonsockeye_01_lg.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishsalmonsockeye_01_ml']			= {['name'] = 'a_c_fishsalmonsockeye_01_ml',	['label'] = 'Salmon Sockeye (Medium-Large)',['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishsalmonsockeye_01_ml.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishsalmonsockeye_01_ms']			= {['name'] = 'a_c_fishsalmonsockeye_01_ms',	['label'] = 'Salmon Sockeye (Medium)',		['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishsalmonsockeye_01_ml.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishsmallmouthbass_01_lg']		= {['name'] = 'a_c_fishsmallmouthbass_01_lg',	['label'] = 'Small Mouth Bass (Large)',		['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishsmallmouthbass_01_lg.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},
	['a_c_fishsmallmouthbass_01_ms']		= {['name'] = 'a_c_fishsmallmouthbass_01_ms',	['label'] = 'Small Mouth Bass (Medium)',	['weight'] = 300,	['type'] = 'item',	['image'] = 'a_c_fishsmallmouthbass_01_ms.png',			['unique'] = true,		['useable'] = true,		['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	['description'] = ''},

