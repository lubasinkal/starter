require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

-- Set default shell
local pwsh = "C:\\Program Files\\PowerShell\\7\\pwsh.exe"

-- Fallback to PowerShell if pwsh is empty
if pwsh == "" then
    pwsh = "powershell"
end

-- Configure shell options
vim.opt.shell = pwsh
vim.opt.shellcmdflag = "-NoLogo -NoProfileLoadTime -NoProfile -Command"