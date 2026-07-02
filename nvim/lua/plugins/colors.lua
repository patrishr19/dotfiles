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
-- return {
--     {
-- 	"blazkowolf/gruber-darker.nvim",
-- 	config = function()
-- 	    require("gruber-darker").setup({
-- 		bold = true,
-- 	      invert = {
-- 		signs = false,
-- 		tabline = false,
-- 		visual = false,
-- 	      },
-- 	      italic = {
-- 		strings = true,
-- 		comments = true,
-- 		operators = false,
-- 		folds = true,
-- 		},
-- 		undercurl = true,
-- 		underline = true,
-- 	    })
-- 	    vim.cmd.colorscheme("gruber-darker")
-- 	    -- enable_transparency()
-- 	end,
--     },
--     {
-- 	"nvim-lualine/lualine.nvim",
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
--     },
-- }
-- return { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...}
-- return {
--   "navarasu/onedark.nvim",
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require('onedark').setup {
--       style = 'darker'
--     }
--     require('onedark').load()
--   end
-- }

--     {
-- 	"nvim-lualine/lualine.nvim",
-- 	dependencies = {
-- 	    "nvim-tree/nvim-web-devicons",
-- 	},



-- return {
--     {
-- 	"nvim-lualine/lualine.nvim",
-- 	dependencies = {
-- 	    "nvim-tree/nvim-web-devicons",
--     },
--     {  "navarasu/onedark.nvim",
-- 	  priority = 1000, -- make sure to load this before all the other start plugins
-- 	  config = function()
-- 	    require('onedark').setup {
-- 	      style = 'darker'
-- 	    }
-- 	    require('onedark').load()
-- 	  end
-- 	},
-- }}

return {
        {  "navarasu/onedark.nvim",
	  priority = 1000, -- make sure to load this before all the other start plugins
	  config = function()
	    require('onedark').setup {
	      style = 'darker'
	    }
	    require('onedark').load()
	  end
	},
        {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {
	    theme = 'onedark',
	    sections = {
		lualine_c = {
		    {
			'filename',
			path = 1,
		    },
		},
	    },
	},
    },
}
