return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      local ok, configs = pcall(require, 'nvim-treesitter.configs')
      if not ok then
        vim.notify('nvim-treesitter.configs not found', vim.log.levels.WARN)
        return
      end

      configs.setup({
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
