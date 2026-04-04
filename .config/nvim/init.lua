vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.number = true -- line num
vim.opt.relativenumber = true -- for jumping
vim.opt.wrap = false -- line wrap
vim.opt.cursorline = true -- highlight line
vim.opt.signcolumn = "yes" -- extra column for errors

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false,
      config = function()
        require("catppuccin").setup({
          transparent_background = true,
        })
        vim.cmd.colorscheme("catppuccin")
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      end,
    },
    { 'nvim-telescope/telescope.nvim', 
        version = '*',
        dependencies = {
          'nvim-lua/plenary.nvim',
        }
    },
    { "nvim-treesitter/nvim-treesitter",
    branch = "main",
      lazy = false,
      build = ":TSUpdate",
    },
    { "nvim-tree/nvim-tree.lua",
      config = function()
        require("nvim-tree").setup({
            sync_root_with_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = true,
            },
            actions = {
                change_dir = {
                    enable = true,
                    global = true,
                },
            },
        })
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>",
        { desc = "Toggle file tree"})
      end,
    },
    { "nvim-lualine/lualine.nvim",
      dependencies = { "catppuccin/nvim" },
      config = function()
        require("lualine").setup({
          options = {
            theme = "auto",
          },
        })
      end,
    },
    { "IogaMaster/neocord",
      event = "VeryLazy",
      config = function()
        require("neocord").setup({
          global_timer = true,
        })
      end,
    },
    { "akinsho/toggleterm.nvim",
      config = function()
        require("toggleterm").setup({
            open_mapping = [[<c-\>]],
            direction = "float",
        })
      end,
    },
   
}
local opts = {}

require("lazy").setup(plugins, opts)

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', function()
  builtin.find_files({ cwd = vim.fn.getcwd() })
end, {})

vim.keymap.set('n', '<leader>fg', function()
  builtin.live_grep({ cwd = vim.fn.getcwd() })
end, {})


vim.keymap.set("n", "<leader>n", function()
vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative numbers" })
