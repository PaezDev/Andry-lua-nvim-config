local map = vim.api.nvim_set_keymap
options = { noremap = true }
silent_opts = { noremap = true, silent = true }

-- Terminal remaps
map('t', '<esc>', "<C-\\><C-n>", silent_opts)
map('t', 'jk', "<C-\\><C-n>", silent_opts)

-- Change panes on vim ctrl mappings
map('n', '<C-h>', '<C-w>h', options)
map('n', '<C-j>', '<C-w>j', options)
map('n', '<C-k>', '<C-w>k', options)
map('n', '<C-l>', '<C-w>l', options)
-- Buffer controls
map('n', '<S-l>', '<cmd>bn<CR>', options) -- buffer next
map('n', '<S-h>', '<cmd>bp<CR>', options) -- buffer previous
map('n', '<S-c>', '<cmd>bd<CR>', options ) -- buffer delete
-- Window splitting
map('n', '<leader>ws', '<C-w>s', options) -- horizontal
map('n', '<leader>wv', '<C-w>v', options) -- vertical
-- Tab controls
map('n', '<leader>tn', '<cmd>tabnew<cr>', options) -- new tab
map('n', '<C-.>', '<cmd>tabnext<cr>', options) -- next tab
map('n', '<C-,>', '<cmd>tabprevious<cr>', options) -- previous tab
-- resizing panes
map("n", "<Left>", ":vertical resize +1<CR>", silent_opts)
map("n", "<Right>", ":vertical resize -1<CR>", silent_opts)
map("n", "<Up>", ":resize +1<CR>", silent_opts)
map("n", "<Down>", ":resize -1<CR>", silent_opts)
-- save and close
map("n", "<Leader>w", ":w<cr>", options)
map("n", "<Leader>q", ":q<cr>", options)
-- Terminal in new tab
map('n', '<leader>t', '<cmd>tabnew<CR><cmd>term<CR>', options)
-- Edit init.lua config file
map('n', '<leader>nc', '<cmd>tabnew<CR><cmd>e ~/.config/nvim/lua/remaps.lua<CR>', options)
-- Escape maps to a rolling jk
map('i', 'jk', '<esc>', options)
