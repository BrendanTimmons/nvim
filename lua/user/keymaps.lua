local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- shorter function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",



-- NORMAL MODE BINDS --

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)



-- INSERT MODE BINDS --

-- Press tf fast to save in insert mode
keymap("i", "tf", "<ESC>:w<CR>", opts)



-- VISUAL MODE BINDS --

-- Stay in visual block when indenting 
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- Telescope
keymap("n", "<C-P>", "<cmd> lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>ff", "<cmd> lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<C-F>", "<cmd> lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fg", "<cmd> lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fb", "<cmd> lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd> lua require('telescope.builtin').help_tags()<cr>", opts)

-- Coc
-- GoTo Navigation
keymap("n", "gd", "<Plug>(coc-definition)", opts)
keymap("n", "gy", "<Plug>(coc-type-definition)", opts)
keymap("n", "gi", "<Plug>(coc-implementation)", opts)
keymap("n", "gr", "<Plug>(coc-references)", opts)

keymap("n", "<leader>.", "<Plug>(coc-codeaction-line)", opts)
keymap("n", "<leader>,", "<Plug>(coc-codeaction)", opts)
keymap("n", "<leader>rn", "<Plug>(coc-rename)", opts)
keymap("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)
