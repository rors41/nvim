return {
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
            vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
                { desc = "Trouble toggle", silent = true, noremap = true }
            )
            vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
                { desc = "Trouble toggle quickfix", silent = true, noremap = true }
            )
            vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
                { desc = "Trouble toggle document", silent = true, noremap = true }
            )
            vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
                { desc = "Trouble toggle workspace", silent = true, noremap = true }
            )
        end

    }
}
