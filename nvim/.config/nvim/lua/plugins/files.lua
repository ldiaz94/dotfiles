return {
    'nvim-telescope/telescope.nvim', version = '*',
    config = function ()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

        telescope.setup({
            defaults = {
                find_command = { 'fd', '--type', 'f', '--hidden', '--strip-cwd-prefix', '--no-ignore-vcs', '--exclude', '.git', '--exclude', 'node_modules' },
            },
            pickers = {
                find_files = {
                    find_command = { 'fd', '--type', 'f', '--hidden', '--strip-cwd-prefix', '--no-ignore-vcs', '--exclude', '.git', '--exclude', 'node_modules' },
                },
                live_grep = {
                    find_command = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' },
                },
            },
        })

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end,
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
}
