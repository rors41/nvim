vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw" })
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Show Lazy menu" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting buffer" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy into clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line into clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without overwriting buffer" })

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>fp", "<cmd>!tmux neww tmux-windowizer<CR><CR>")
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { desc = "Format file" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>rc", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Sed replace word under cursor" })
vim.keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { desc = "Make file executable", silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Meme" });
