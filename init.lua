require("core.keymaps")
require("core.plugins")
require("core.treesitter")
require("core.telescope")
require("core.proga")
require("core.plugins_cfg.mason")
require("core.plugins_cfg.lsp_config")
require("core.plugins_cfg.completions")

--color theme
--[[vim.cmd('packadd kanagawa.nvim') 

require("kanagawa").setup({
    theme = "wave", -- the one i want to change 
    background = "dark", 
    
 -- change the color of the opt number box
    colors = {
        theme = {
            all = {
                ui = {
                    --bg_gutter = "none",--to put the line number in the same colour as the rest
                },
            },
        },
    },
})--]]
vim.cmd("colorscheme retrobox")
--vim.cmd("colorscheme zaibatsu/unokai")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    view = {
        width = 30,
    },
    filters = {
        dotfiles = false,
    },
})

vim.keymap.set('n', '<space>e', ':NvimTreeToggle<CR>', { silent = true, desc = 'Alternar Tree' })

-- having tabs visible
require("bufferline").setup {
    options = {
        always_show_bufferline = true,
    },
}
-- tab manipulation
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', '<space>m', ':bdelete<CR>', { desc = 'Close current Buffer' })

-- telescope manipulation
local builtin = require('telescope.builtin') 
vim.keymap.set('n', '<C-p>', builtin.find_files, {})--find files in the same probject
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})--find recent opened files on vim
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})


-- Set up terminal-related options for better compatibility
vim.opt.termguicolors = true   -- Use 24-bit colors in terminal
vim.opt.encoding = "utf-8"     -- Use UTF-8 encoding
-- Reduce the time Neovim waits for key sequences (important for <Esc>)
vim.opt.timeoutlen = 300
--confirm when leaving
vim.o.confirm = true
