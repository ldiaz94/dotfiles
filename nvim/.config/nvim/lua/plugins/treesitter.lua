return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup()

      -- Install parsers (async, no-ops if already installed)
      require('nvim-treesitter').install({
        'lua', 'python', 'typescript', 'javascript', 'json',
        'yaml', 'toml', 'rust', 'bash', 'vim', 'vimdoc',
        'markdown', 'markdown_inline',
      })
    end,
  },
}
