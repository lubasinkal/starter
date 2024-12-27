-- Set up base46 cache path and leader key
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "
-- Set the font for Neovide
if vim.g.neovide then
  vim.opt.guifont = "JetBrainsMono Nerd Font:h13"
  -- Optional: Additional settings
  vim.g.neovide_antialiasing = true  -- Enable anti-aliasing
  vim.g.neovide_render_scale = 1.0   -- Font render scale
  vim.g.neovide_clipboard = true
  vim.opt.clipboard = 'unnamedplus'
end
-- Set the font for Neovide
if vim.g.nvy then
  vim.opt.guifont = "JetBrainsMono Nerd Font:h13"
 end


-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true

-- Load Lazy configuration
local lazy_config = require "configs.lazy"

-- Load plugins using Lazy.nvim
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },  -- Ensure this imports your other plugin configurations
  
  -- {
  --   -- Codeium plugin configuration
  --   "Exafunction/codeium.nvim",
  --   cmd = "Codeium",
  --   event = "InsertEnter",
  --   build = ":Codeium Auth",
  --   opts = {
  --       },
  -- },
  -- -- -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
}, lazy_config)

-- Load theme and other configurations
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

require("oil").setup({
  default_file_explorer = true,
})

-- require("codeium").setup({
--   -- Optionally disable cmp source if using virtual text only
--   enable_cmp_source = false,
--   virtual_text = {
--       enabled = true,
--
--       -- These are the defaults
--
--       -- Set to true if you never want completions to be shown automatically.
--       manual = false,
--       -- A mapping of filetype to true or false, to enable virtual text.
--       filetypes = {},
--       -- Whether to enable virtual text of not for filetypes not specifically listed above.
--       default_filetype_enabled = true,
--       -- How long to wait (in ms) before requesting completions after typing stops.
--       idle_delay = 75,
--       -- Priority of the virtual text. This usually ensures that the completions appear on top of
--       -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
--       -- desired.
--       virtual_text_priority = 65535,
--       -- Set to false to disable all key bindings for managing completions.
--       map_keys = true,
--       -- The key to press when hitting the accept keybinding but no completion is showing.
--       -- Defaults to \t normally or <c-n> when a popup is showing. 
--       accept_fallback = nil,
--       -- Key bindings for managing completions in virtual text mode.
--       key_bindings = {
--           -- Accept the current completion.
--           accept = "<Tab>",
--           -- Accept the next word.
--           accept_word = false,
--           -- Accept the next line.
--           accept_line = false,
--           -- Clear the virtual text.
--           clear = false,
--           -- Cycle to the next completion.
--           next = "<M-]>",
--           -- Cycle to the previous completion.
--           prev = "<M-[>",
--       }
--   }
-- })
