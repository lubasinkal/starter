return {
  -- Dependency for utility functions
  "nvim-lua/plenary.nvim",

  -- Completion framework
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer",     -- Buffer source for nvim-cmp
      "hrsh7th/cmp-path",       -- Path source for nvim-cmp
      "hrsh7th/cmp-cmdline",    -- Cmdline source for nvim-cmp
      -- Add any other sources you might need
    },
  },

  -- Codeium plugin
  {
    "Exafunction/codeium.nvim",
    cmd = "Codeium",
    event = "InsertEnter",
    build = ":Codeium Auth",
    opts = {
      enable_cmp_source = vim.g.ai_cmp,
      virtual_text = {
        enabled = not vim.g.ai_cmp,
        key_bindings = {
          accept = false,
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
    },
  },
}
