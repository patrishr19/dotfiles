-- local function enable_transparency()
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
-- end
-- return {
--     {
-- 	"folke/tokyonight.nvim",
-- 	config = function()
-- 	    vim.cmd.colorscheme("tokyonight")
-- 	    enable_transparency()
-- 	end
--     },
--     {
-- 	"nvim-lualine/lualine.nvim",
-- 	dependencies = {
-- 	    "nvim-tree/nvim-web-devicons",
-- 	},
-- 	opts = {
-- 	    theme = 'tokyonight',
-- 	    sections = {
-- 		lualine_c = {
-- 		    {
-- 			'filename',
-- 			path = 1,
-- 		    },
-- 		},
-- 	    },
-- 	},
--     },
-- }

-- return {{
-- 'AlexvZyl/nordic.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require('nordic').load()
--     end,
-- },
-- {	"nvim-lualine/lualine.nvim",
-- 	dependencies = {
-- 	    "nvim-tree/nvim-web-devicons",
-- 	},
-- 	opts = {
-- 	    theme = 'auto',
-- 	    sections = {
-- 		lualine_c = {
-- 		    {
-- 			'filename',
-- 			path = 1,
-- 		    },
-- 		},
-- 	    },
-- 	},
-- }
--
-- }
--
return {{
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').setup({
            transparent = {
                bg = true,
                float = true,
            },
        })
        require('nordic').load()
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    end,
},
{
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        theme = 'auto',
        sections = {
            lualine_c = {
                {
                    'filename',
                    path = 1,
                },
            },
        },
    },
}
}
