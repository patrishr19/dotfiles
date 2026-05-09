vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.env.PATH = vim.env.PATH .. ':' .. vim.fn.expand('~/.local/bin')
vim.opt.autochdir = false


vim.filetype.add({
    pattern = {
        [".*/hypr/.*%.conf"] = "hyprlang",
    },
})

vim.keymap.set("n", "<leader>t", "<cmd>split | terminal<cr>")
vim.keymap.set("n", "<leader>T", "<cmd>vsplit | terminal<cr>")


