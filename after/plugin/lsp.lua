local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'clangd',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
        { desc = "Go to definition", buffer = bufnr, remap = false })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = "Hover", buffer = bufnr, remap = false })
    -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {buffer = bufnr, remap = false})
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
        { desc = "Open float", buffer = bufnr, remap = false })
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { buffer = bufnr, remap = false })
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end,
        { desc = "Code action", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end,
        { desc = "References", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end,
        { desc = "Rename", buffer = bufnr, remap = false })
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
        { desc = "Signature help", buffer = bufnr, remap = false })
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
