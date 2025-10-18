local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set the leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Search
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Indentation on selection
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Undo the selection
keymap("n", "<leader>[", ":nohl<CR>", opts)

-- Go to the file tree
keymap("n", "<leader>e", ":Oil<Cr>", opts)

-- Telescope
keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>g", ":Telescope git_files<CR>", opts)
keymap("n", "<leader>t", ":Telescope live_grep<CR>", opts)

-- Undotree
keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)

-- Move
keymap('n', '<A-j>', ':MoveLine(1)<CR>', opts)
keymap('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
keymap('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
keymap('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)

-- Disable arrow (for review)
keymap("n", "<Up>", "", opts)
keymap("n", "<Down>", "", opts)
keymap("n", "<Left>", "", opts)
keymap("n", "<Right>", "", opts)

keymap("i", "<Up>", "", opts)
keymap("i", "<Down>", "", opts)
keymap("i", "<Left>", "", opts)
keymap("i", "<Right>", "", opts)
