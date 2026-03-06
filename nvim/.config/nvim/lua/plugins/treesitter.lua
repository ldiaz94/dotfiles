return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'lua',
          'python',
          'typescript',
          'javascript',
          'json',
          'yaml',
          'toml',
          'rust',
          'bash',
          'vim',
          'vimdoc',
          'markdown',
          'markdown_inline',
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          disable = {},
        },
        indent = {
          enable = true,
          disable = {},
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
          },
        },
      })
    end,
  },
}
