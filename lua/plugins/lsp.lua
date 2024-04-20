return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "pyright",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        local autocmd = vim.api.nvim_create_autocmd
        autocmd('LspAttach', {
            callback = function(e)
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
                    { desc = "Go to definition", buffer = e.buf, remap = false })
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
                    { desc = "Hover", buffer = e.buf, remap = false })
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
                    { buffer = e.buf, remap = false })
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
                    { desc = "Open float", buffer = e.buf, remap = false })
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { buffer = e.buf, remap = false })
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { buffer = e.buf, remap = false })
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
                    { desc = "Code action", buffer = e.buf, remap = false })
                vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end,
                    { desc = "References", buffer = e.buf, remap = false })
                vim.keymap.set("n", "<leader>vn", function() vim.lsp.buf.rename() end,
                    { desc = "Rename", buffer = e.buf, remap = false })
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
                    { desc = "Signature help", buffer = e.buf, remap = false })
            end
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },

        })

        vim.keymap.set("n", "<leader>vt",
            function()
                vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
            end,
            { desc = "Toggle diagnostic virual text" })

        vim.diagnostic.config({
            virtual_text = true
        })
    end
}
