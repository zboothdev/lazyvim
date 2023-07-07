-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[
    augroup filetypefix
    autocmd!
        " Treat WAF wscript as a python file
        autocmd BufNewFile,BufRead wscript* set filetype=python

        " Udev rules
        autocmd FileType hog set filetype=udevrules
    augroup END
]])
