return {
    "folke/zen-mode.nvim",
    -- "eandrju/cellular-automaton.nvim",
        {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        config = function ()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find open buffers" })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
            vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Show keymaps" })
            vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = "Find document symbols" })
            vim.keymap.set('n', '<leader>fws', builtin.lsp_workspace_symbols, { desc = "Find workspace symbols" })

            -- vim.keymap.set('n', '<leader>gc', builtin.git_commits, {desc = "Git commits"})
            -- vim.keymap.set('n', '<leader>gcb', builtin.git_bcommits, {desc = "Git buffer commits"})
            -- vim.keymap.set('n', '<leader>gb', builtin.git_branches, {desc = "Git branches"})
            -- vim.keymap.set('n', '<leader>gs', builtin.git_status, {desc = "Git status"})
            -- vim.keymap.set('n', '<leader>ggs', builtin.git_stash, {})

            vim.keymap.set('n', '<leader>ftb', builtin.builtin, {desc = "Telescope builtin menu" })
        end,
    },
}