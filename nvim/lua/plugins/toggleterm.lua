return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
	    open_mapping = [[<C-M-t>]],
            direction = "vertical",
	    dir = "%:p:h",
        })
    end,
}
