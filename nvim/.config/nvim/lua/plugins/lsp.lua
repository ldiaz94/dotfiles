return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'basedpyright', 'ts_ls', 'rust_analyzer' },
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local servers = { 'lua_ls', 'basedpyright', 'ts_ls', 'rust_analyzer' }
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          cmd_env = os.environ(),
          capabilities = capabilities,
        })
      end

      -- LSP keybindings
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'Go to definition' })
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = 'Go to references' })
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'Hover' })
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'Rename' })
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'Code action' })
        end,
      })
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        }),
      })
    end,
  },
}
