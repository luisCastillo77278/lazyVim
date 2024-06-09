-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map("i", "jk", "<ESC>", { noremap = true, silent = true })
map("n", "<leader>ts", "<cmd>BufferLinePick<CR>", { noremap = true, silent = true })
map("n", "<leader>to", "<cmd>LiveServerStart<CR>", { noremap = true, silent = true })
map("n", "<leader>tc", "<cmd>LiveServerStop<CR>", { noremap = true, silent = true })
