require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

-- Set default shell
local pwsh = "C:\\Program Files\\WindowsApps\\Microsoft.PowerShell_7.4.6.0_x64__8wekyb3d8bbwe\\pwsh.exe"

-- Fallback to PowerShell if pwsh is empty
if pwsh == "" then
    pwsh = "powershell"
end

-- Configure shell options
vim.opt.shell = pwsh
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command -"