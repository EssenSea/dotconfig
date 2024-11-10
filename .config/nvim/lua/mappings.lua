require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>ww", "<cmd>TranslateW<CR>")
map("v", "<leader>ww", "<cmd>TranslateWV<CR>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
