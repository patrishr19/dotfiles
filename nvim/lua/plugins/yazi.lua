return {
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("yazi").setup()
            vim.keymap.set("n", "<leader>y", "<cmd>Yazi<cr>")
            vim.keymap.set("n", "<leader>Y", "<cmd>Yazi cwd<cr>")
        end,
    }
}
