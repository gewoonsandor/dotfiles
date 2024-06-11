require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

vim.api.nvim_set_keymap("n", "<C-h>", ":<C-U>TmuxNavigateLeft<CR>", { silent = true, desc = "Navigate to the left tmux pane" })
vim.api.nvim_set_keymap("n", "<C-j>", ":<C-U>TmuxNavigateDown<CR>", { silent = true, desc = "Navigate to the down tmux pane" })
vim.api.nvim_set_keymap("n", "<C-k>", ":<C-U>TmuxNavigateUp<CR>", { silent = true, desc = "Navigate to the up tmux pane" })
vim.api.nvim_set_keymap("n", "<C-l>", ":<C-U>TmuxNavigateRight<CR>", { silent = true, desc = "Navigate to the right tmux pane" })
vim.api.nvim_set_keymap("n", "<C-p>", ":<C-U>TmuxNavigatePrevious<CR>", { silent = true, desc = "Navigate to the previous tmux pane" })

