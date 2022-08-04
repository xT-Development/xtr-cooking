# xt-cooking
### Simple Cooking w/ Rep || xThrasherrr#6666

# Installation:
- Add items to `shared/items.lua`
- Add item images to `qbr-inventory/html/images`
- Add rep to `qbr-core/server/player.lua`:
```lua
PlayerData.metadata['cookingrep'] = PlayerData.metadata['cookingrep'] or 0
```
- Add to qbr-target config:
```lua
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
			event = "xt-crafting:MainMenu",
			icon = "fas fa-fire",
			label = "Cook Food",
		}
	},
	distance = 3.0
},
```

# Dependencies:
- qbr-core : https://github.com/qbcore-redm-framework/qbr-core
- qbr-target : https://github.com/Andyauk/qbr-target
