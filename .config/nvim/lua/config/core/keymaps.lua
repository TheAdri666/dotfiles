vim.g.mapleader = " "

local keymap = vim.keymap

-- Change modes.
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk." })

-- Search results.
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights." })
-- Increment / Decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number." })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number." })

-- Window management.
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically." })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally." })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make current splits the same size." })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Split window vertically." })

-- Tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab." })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab." })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab." })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab." })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current file in new tab." })
