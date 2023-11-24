return {
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        config = function()
            local dap = require('dap')
            local mason_registry = require("mason-registry")
            local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
            local codelldb_path = codelldb_root .. "adapter/codelldb"
            -- local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"

            dap.adapters.codelldb = {
                type = 'server',
                port = "${port}",
                executable = {
                    -- Change this to your path!
                    command = codelldb_path,
                    args = { "--port", "${port}" },
                }
            }

            dap.configurations.rust = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                },
            }
        end,
    }
}
