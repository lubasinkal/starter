-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

--paste sections in 
--
--${env:LOCALAPPDATA}\nvim-data\lazy\ui\lua\nvconfig.lua
---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "dark_horizon",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },

	nvdash = {
		load_on_startup = true,
		header = {
			
			"██╗     ███████╗███╗   ██╗",
			"██║     ██╔════╝████╗  ██║",
			"██║     ███████╗██╔██╗ ██║",
			"██║     ╚════██║██║╚██╗██║",
			"███████╗███████║██║ ╚████║",
			"╚══════╝╚══════╝╚═╝  ╚═══╝",
			"     LUBASI  KAL        ",
		},                          
	

	
	buttons = {
	  { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
	  { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
	  { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
	  { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
	  { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },
	  { txt = "  Config", keys = "c", cmd = ":e $MYVIMRC" },  -- Added button to open config folder
	
	  { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
	
	  {
		txt = function()
		  local stats = require("lazy").stats()
		  local ms = math.floor(stats.startuptime) .. " ms"
		  return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
		end,
		hl = "NvDashFooter",
		no_gap = true,
	  },
	
	  { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
	},

}
}

return M
