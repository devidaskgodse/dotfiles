local map = vim.keymap.set

-- yank to system clipboard
map({'n', 'v'}, '<leader>y', [["+y]])

-- exit to file tree
-- map('n', '<leader>pv', vim.cmd.Ex)

-- map('i', 'jk', '<ESC>')

-- increment or decrement numbers
map('n', '<leader>+', '<C-a>')
map('n', '<leader>-', '<C-x>')

-- window splits
-- map('n', '<leadaer>sv', '<C-w>v') -- split window vertically
-- map('n', '<leadaer>sh', '<C-w>s') -- split window horizontally
-- map('n', '<leadaer>se', '<C-w>=') -- split window to equal windth
map('n', '<leader>x', ':close<CR>') -- close current split window


------------------
-- plugin keymaps
------------------

-- nvim-tree
map('n', '<leader>e', ':NvimTreeToggle<CR>')

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
