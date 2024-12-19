return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require('telescope')

        -- Custom function to find files while ignoring Excel files and specific folders
        local function custom_find_files()
            telescope.builtin.find_files({
                previewer = false,  -- Disable previewer for all files
                find_command = {
                    'rg', '--files', '--hidden',
                    '--glob', '!*.xlsx', 
                    '--glob', '!*.xls',
                    '--glob', '!*.xlm',
                    '--glob', '!*.xlsm',
                    '--glob', '!OneDrive - campempirica.com 1/**'  -- Exclude the specified OneDrive folder
                }
            })
        end

        telescope.setup{}

        -- Bind the custom function to a key mapping
        vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua custom_find_files()<cr>', { noremap = true, silent = true })
    end
}
