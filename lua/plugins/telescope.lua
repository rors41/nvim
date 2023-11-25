return {
    {"nvim-telescope/telescope-dap.nvim"},
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find open buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
            vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Show keymaps" })
            vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find document symbols" })
            vim.keymap.set("n", "<leader>fws", builtin.lsp_workspace_symbols, { desc = "Find workspace symbols" })

            vim.keymap.set("n", "<leader>ftb", builtin.builtin, { desc = "Telescope builtin menu" })

            require("telescope").setup()
            require("telescope").load_extension("dap")

            local telescope_dap = require("telescope").extensions.dap;

            vim.keymap.set("n", "<leader>dsc", telescope_dap.commands, { desc = "Show commands" })
            vim.keymap.set("n", "<leader>dC", telescope_dap.configurations, { desc = "Show configurations" })
            vim.keymap.set("n", "<leader>dB", telescope_dap.list_breakpoints, { desc = "List breakpoints" })
            vim.keymap.set("n", "<leader>dV", telescope_dap.variables, { desc = "Show variables" })
            vim.keymap.set("n", "<leader>dF", telescope_dap.frames, { desc = "Show call stack frames" })

        end,
    },
}
