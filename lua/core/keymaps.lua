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

-- --- INDENTATION SETTINGS (4 SPACES) ---

-- Set indentation options to use 4 spaces. Change '4' to '2' if preferred.

-- 1. `tabstop`: Number of spaces a <Tab> character uses for display.
vim.opt.tabstop = 2

-- 2. `shiftwidth`: Number of spaces used for auto-indent (e.g., when pressing Enter or using << / >>).
vim.opt.shiftwidth = 2

-- 3. `expandtab`: Convert <Tab> keypresses into spaces (Highly recommended).
vim.opt.expandtab = true

-- 4. `smartindent`: Tries to guess the correct indent based on syntax.
vim.opt.smartindent = truej
