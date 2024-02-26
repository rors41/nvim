return {

    "nvim-treesitter/playground",

    "nvim-treesitter/nvim-treesitter-context",

    "eandrju/cellular-automaton.nvim",

    -- "theprimeagen/refactoring.nvim",
    --
    {
        "theHamsta/nvim-dap-virtual-text",
        event = "VeryLazy",
        config = function()
            require("nvim-dap-virtual-text").setup({})
        end

    },

    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({})
        end
    },

    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
            }
        end
    },

    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = true,
    --     opts = { style = "storm" },
    -- },

    {
        "marko-cerovac/material.nvim",
        lazy = true,
        opts = {}
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    {
        'stevearc/dressing.nvim',
        opts = {},
    }
}
