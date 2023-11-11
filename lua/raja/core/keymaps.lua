vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- Use jk to escape
keymap.set("i", "j", "<ESC>")

-- Save file
keymap.set('n',"<leader>s",":w<CR>")

-- Tabs configuration
keymap.set("n", "<C-t>",":tabnew<CR>") -- open new tab
keymap.set("n", "<C-x>", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>to", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- Increment and decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- Togle file explorer
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer