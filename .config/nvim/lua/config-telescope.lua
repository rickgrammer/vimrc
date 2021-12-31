-- require('telescope').setup(){
--     defaults = {
--         ['<leader>ll'] = ':Telescope<CR>'
--     }
-- }
vim.api.nvim_set_keymap('n', '<leader>ll', ":lua require'telescope.builtin'.buffers{}<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':lua require\'telescope.builtin\'.find_files{}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fa', ':lua require\'telescope.builtin\'.live_grep{}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lr', ':lua require\'telescope.builtin\'.registers{}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lc', ':lua require\'telescope.builtin\'.colorscheme{}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ll', ':lua require\'telescope.builtin\'.colorscheme{}<CR>', { noremap = true, silent = true })

-- git
vim.api.nvim_set_keymap('n', '<leader>lgs', ':lua require\'telescope.builtin\'.git_stash{}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lgb', ':lua require\'telescope.builtin\'.git_branches{}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lgb', ':lua require\'telescope.builtin\'.git_commits{}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lgb', ':lua require\'telescope.builtin\'.git_bcommits{}<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<leader>p', ':lua require\'telescope.builtin\'.treesitter{}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pr', ':lua require\'telescope.builtin\'.lsp_references{}<CR>', { noremap = true, silent = true })

-- require('telescope').load_extension('fzf')
