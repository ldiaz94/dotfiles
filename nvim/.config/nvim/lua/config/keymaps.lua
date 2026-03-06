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

-- Treesitter incremental selection
local selection_node = nil

local function select_node(node)
  if not node then return end
  selection_node = node
  local sr, sc, er, ec = node:range()
  vim.api.nvim_win_set_cursor(0, { sr + 1, sc })
  vim.cmd('normal! v')
  vim.api.nvim_win_set_cursor(0, { er + 1, ec - 1 })
end

map('n', 'gnn', function()
  local node = vim.treesitter.get_node()
  select_node(node)
end, { noremap = true, silent = true, desc = 'Start treesitter selection' })

map('x', 'grn', function()
  local node = selection_node and selection_node:parent() or vim.treesitter.get_node()
  select_node(node)
end, { noremap = true, silent = true, desc = 'Expand treesitter selection' })

map('x', 'grm', function()
  if not selection_node then return end
  local node = selection_node:child(0)
  if node then select_node(node) end
end, { noremap = true, silent = true, desc = 'Shrink treesitter selection' })
