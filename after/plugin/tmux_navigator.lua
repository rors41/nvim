vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<cr>",
    { desc="Window left", silent = true, noremap = true }
)
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<cr>",
    { desc="Window right", silent = true, noremap = true }
)
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<cr>",
    { desc="Window down", silent = true, noremap = true }
)
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<cr>",
    { desc="Window up", silent = true, noremap = true }
)
