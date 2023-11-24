return {
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            local dap, dapui = require("dap"), require("dapui");

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            dap.listeners.after.event_terminated["dapui_config"] = function()
                dapui.close()
            end

            dap.listeners.after.event_exited["dapui_config"] = function()
                dapui.close()
            end

            vim.keymap.set("n", "<leader>dt", ":DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" });
            vim.keymap.set("n", "<leader>dx", ":DapTerminate<CR>", { desc = "DAP Terminate" });
            vim.keymap.set("n", "<leader>do", ":DapStepOver<CR>", { desc = "Step Over" });
            dapui.setup()
        end
    }
}
