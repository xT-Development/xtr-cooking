<a href='https://ko-fi.com/W7W2DTUIV' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://cdn.ko-fi.com/cdn/kofi4.png?v=3' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

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
# Features:
- Minigame when cooking
	- If failed, lose items and possibly lose rep
- Admin command to set players cooking rep : `/setcookingrep`
- Placeable Campfires
	- Burnout over time (Set in Config)
	- Stoke fires so they burn longer (Set in Config)
	- Put out fires using target
	- Enable / Disable Using Radial Menu (Set in Config)

# Dependencies:
- qbr-target : https://github.com/Andyauk/qbr-target
- qbr-lock : https://github.com/SagginChairLLC/qbr-lock
- qbr-radialmenu : https://github.com/Andyauk/qbr-radialmenu
- qbr-core : https://github.com/qbcore-redm-framework/qbr-core

### Join my Development Discord:
- https://discord.gg/cmWRvTHJBN
