vim.g.mapleader = " "

vim.g.maplocalleader = " "

vim.keymap.set("n", "<space>", "<Nop>", { silent = true, noremap = true, desc = "Space as leader"})
--leader

vim.opt.number = true
--show nums

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.cursorline=true

-- Set global leader key (optional, but good practice)
vim.g.mapleader = " "

--  `tabstop`: Number of spaces a <Tab> character uses for display.
vim.opt.tabstop = 2

--  `shiftwidth`: Number of spaces used for auto-indent (e.g., when pressing Enter or using << / >>).
vim.opt.shiftwidth = 2

-- `expandtab`: Convert <Tab> keypresses into spaces (Highly recommended).
vim.opt.expandtab = true

--  `smartindent`: Tries to guess the correct indent based on syntax.
vim.opt.smartindent = true

--show the error in the code line 
vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
    spacing = 5,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
      [vim.diagnostic.severity.INFO] = ' ',
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- tab manipulation
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', '<space>m', ':bdelete<CR>', { desc = 'Close current Buffer' })

-- telescope manipulation
local builtin = require('telescope.builtin') 
vim.keymap.set('n', '<C-p>', builtin.find_files, {})--find files in the same probject
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})--find recent opened files on vim
-- need to install ripgrep
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
--not using rn vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})

