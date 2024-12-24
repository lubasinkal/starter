-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls","pyright","gopls","r_language_server","ruff" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
-- Single server configurations with specific filetypes

-- Pyright configuration for Python files
lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",  -- Enforces strict type checking for variables and objects
        autoSearchPaths = true,       -- Automatically finds dependencies in your workspace
        useLibraryCodeForTypes = true, -- Uses library-provided type hints for better analysis
        diagnosticMode = "workspace", -- Analyze all files in the workspace
        autoImportCompletions = true, -- Suggest imports based on variables used
      },
    },
  },
}
-- Ruff configuration for Python files
lspconfig.ruff.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "python" },
  settings = {
    ruff = {
      linting = {
        enabled = true,
      },
      completion = {
        enabled = true,
      },
    },
  },
}

-- R Language Server configuration for R files
lspconfig.r_language_server.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "r", "rmd" }, -- R and R Markdown files
  settings = {
    r = {
      linting = {
        enabled = true,
      },
      completion = {
        enabled = true,
      },
    },
  },
}

-- Gopls configuration for Go files
lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "go", "gomod", "gowork", "gotmpl" }, -- Go files
  settings = {
    gopls = {
      analyses = {
        unusedparams = true, -- Example analysis option
        shadow = true,
      },
      staticcheck = true,
    },
  },
}
