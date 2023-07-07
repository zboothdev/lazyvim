-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.cmd([[
    " Copy current file path into + register (system paste buffer)
    map <leader>cp :let @+ = expand("%:p")<CR>
]])
