return {
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        config = function()
            local dap = require('dap')
            -- vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'red', linehl='', numhl='' });
            -- vim.fn.sign_define('DapBreakpointCondition', { text = 'ﳁ', texthl = 'blue', linehl='', numhl='' });
            -- vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'red', linehl='', numhl='' });
            -- vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'yellow', linehl='', numhl='' });
            -- vim.fn.sign_define('DapStopped', { text = '', texthl = 'green', linehl='', numhl='' });

            vim.keymap.set("n", "<leader>dt", ":DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" });
            vim.keymap.set("n", "<leader>dx", ":DapTerminate<CR>", { desc = "DAP Terminate" });
            vim.keymap.set("n", "<leader>do", ":DapStepOver<CR>", { desc = "Step Over" });
            vim.keymap.set("n", "<leader>di", ":DapStepInto<CR>", { desc = "Step Into" });
            vim.keymap.set("n", "<leader>dO", ":DapStepOut<CR>", { desc = "Step Out" });
            vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>", { desc = "Continue" });

            vim.keymap.set("n", "<leader>dk", dap.up, { desc = "Up the call stack" });
            vim.keymap.set("n", "<leader>dj", dap.down, { desc = "Down the call stack" });

            vim.keymap.set("n", "<leader>dD", function() dap.clear_breakpoints() end, { desc = "Clear all breakpoints" });

            -- local mason_registry = require("mason-registry")
            -- local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
            -- local codelldb_path = codelldb_root .. "adapter/codelldb"
            -- local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"

            -- dap.adapters.codelldb = {
            --     type = 'server',
            --     port = "${port}",
            --     executable = {
            --         -- Change this to your path!
            --         command = codelldb_path,
            --         args = { "--port", "${port}" },
            --     }
            -- }
            --
            -- dap.configurations.rust = {
            --     {
            --         name = "Launch file",
            --         type = "codelldb",
            --         request = "launch",
            --         program = function()
            --             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            --         end,
            --         cwd = '${workspaceFolder}',
            --         stopOnEntry = false,
            --     },
            -- }
        end,
    }
}
