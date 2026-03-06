local map = vim.keymap.set

-- File explorer bindings
map('n', '-', ':Explore<CR>', { noremap = true, silent = true, desc = 'Open file explorer' })
map('n', '_', ':Vexplore<CR>', { noremap = true, silent = true, desc = 'Open vertical file explorer' })
map('n', '|', ':Sexplore<CR>', { noremap = true, silent = true, desc = 'Open horizontal file explorer' })

-- Window navigation
map('n', '<leader>h', '<C-w>h', { noremap = true, silent = true, desc = 'Move to left window' })
map('n', '<leader>j', '<C-w>j', { noremap = true, silent = true, desc = 'Move to bottom window' })
map('n', '<leader>k', '<C-w>k', { noremap = true, silent = true, desc = 'Move to top window' })
map('n', '<leader>l', '<C-w>l', { noremap = true, silent = true, desc = 'Move to right window' })

-- Clear search highlight on Enter
map('n', '<CR>', ':nohl<CR>', { noremap = true, silent = true, desc = 'Clear search highlight' })
