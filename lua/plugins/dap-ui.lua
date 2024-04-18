return {
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dap, dapui = require("dap"), require("dapui");

            vim.keymap.set("n", "<leader>dU", dapui.open, { desc = "Open DAP UI" });
            vim.keymap.set("n", "<leader>dQ", dapui.close, { desc = "Close DAP UI" });

            dap.listeners.after.event_terminated["dapui_config"] = function()
                dapui.close()
            end

            dap.listeners.after.event_exited["dapui_config"] = function()
                dapui.close()
            end

            dapui.setup()
        end
    }
}
