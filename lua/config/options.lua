-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Reset back to default leader.
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

vim.opt.relativenumber = false

-- wildmode: A list of completions will be shown and the command
-- will be completed to the longest common command.
vim.opt.wildmode = "list:longest"

-- Add options from vimrc
vim.opt.showmatch = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.opt.spell = true
vim.opt.spelllang = "en_us"

vim.opt.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<"
