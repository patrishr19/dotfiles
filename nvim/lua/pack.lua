vim.pack.add({
    "https://github.com/bluz71/vim-moonfly-colors",
    "https://github.com/nvim-mini/mini.nvim",
    "https://github.com/rafamadriz/friendly-snippets",
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/sphamba/smear-cursor.nvim",
    { src = "https://github.com/kdheepak/lazygit.nvim", dependencies = "nvim-lua/plenary.nvim"},
    "https://github.com/IogaMaster/neocord",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/brenoprata10/nvim-highlight-colors",
    -- "https://github.com/akinsho/bufferline.nvim",
    "https://github.com/romgrk/barbar.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/folke/tokyonight.nvim.git",
    "https://github.com/nvim-tree/nvim-tree.lua",
    "https://github.com/kaarmu/typst.vim",
    -- "https://github.com/nvimdev/dashboard-nvim",
    -- "https://github.com/folke/snacks.nvim",
})

--mini
-- local MiniFiles = require("mini.files")
-- MiniFiles.setup({
--     mappings = {
--         go_in = "<CR>",
--         go_in_plus = "L",
--         go_out = "_",
--         go_out_plus = "H",
--     },
-- })
-- vim.keymap.set("n", "-", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })
-- vim.keymap.set("n", "<leader>-", function()
--     MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
--     MiniFiles.reveal_cwd()
-- end, { desc = "Toggle into currently opened file" })---- mini notify ----
require("mini.notify").setup({
	-- only show messages
    content = {
        format = function(notif)
            return notif.msg
        end,
    },
})

--- mini cmdline completion ---
require("mini.cmdline").setup({
    autocorrect = { enable = false }
})

--- mini surround ---
require("mini.surround").setup()
-- Default Keymaps
-- | `sa` | Add surrounding or Direct with 'saiw' |
-- | `sd` | Delete surrounding |
-- | `sr` | Replace surrounding |
-- | `sf` | Find surrounding (right) |
-- | `sF` | Find surrounding (left) |
-- | `sh` | Highlight surrounding |
-- | `sn` | Update n_lines |
-- | `l` / `n` | as suffix for prev/next |

local MiniPick = require("mini.pick")
local MiniExtra = require("mini.extra")
MiniPick.setup()
MiniExtra.setup()

-- keymaps
vim.keymap.set("n", "<leader>pf", function() MiniPick.builtin.files() end, { desc = "Mini File Picker" })
vim.keymap.set('n', '<leader>ps', function()
  -- If we are in nvim-tree, grab the proper working directory
  local opts = {
    source = {
      cwd = vim.fn.getcwd()
    }
  }
  MiniPick.builtin.grep_live(opts)
end, { desc = "Grep text safely" })
vim.keymap.set("n", "<leader>vh", function() MiniPick.builtin.help() end, { desc = "Mini Help" })

vim.keymap.set("n", "<leader>xx", function() MiniExtra.pickers.diagnostic() end, { desc = "Mini Picker Diagnostics" })
vim.keymap.set("n", "<leader>pk", function() MiniExtra.pickers.keymaps() end, { desc = 'Search keymaps' })

local MiniCompletion = require("mini.completion")
MiniCompletion.setup({
    lsp_completion = {
        auto_setup = true,
    }
})
-- mini snippets
local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
    snippets = {
        MiniSnippets.gen_loader.from_lang(), -- loads automatically
    },
    expand = {
        insert = function(snippet)
            MiniSnippets.default_insert(snippet, { empty_tabstop = "" })
        end,
    },
})
MiniSnippets.start_lsp_server({ match = false })

local MiniDiff = require("mini.diff")
MiniDiff.setup({
    source = MiniDiff.gen_source.git({ index = false }),
})


local AutoPairs = require("nvim-autopairs")
AutoPairs.setup()

local LuaLines = require("lualine")
LuaLines.setup({
    options = {
        theme = "tokyonight",
        section_separators = "",
        component_separators = "",
    },
})

vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
    callback = function()
        local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
        if not normal.bg then return end
        io.write(string.format("\027]11;#%06x\027\\", normal.bg))
    end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        io.write("\027]111\027\\") -- Resets terminal background to default on exit
    end,
})

local SmearCursor = require("smear_cursor")
SmearCursor.setup({
    options = {
        stiffness = 0.8,                      -- 0.6      [0, 1]
        trailing_stiffness = 0.6,             -- 0.45     [0, 1]
        stiffness_insert_mode = 0.7,          -- 0.5      [0, 1]
        trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
        damping = 0.95,                       -- 0.85     [0, 1]
        damping_insert_mode = 0.95,           -- 0.9      [0, 1]
        distance_stop_animating = 0.5,        -- 0.1      > 0    smear_between_buffers = true,
        smear_between_neighbor_lines = true,
        scroll_buffer_space = true,
        smear_insert_mode = true,
    },
})

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>")

require('nvim-web-devicons').setup({
    default = true;
})


require("nvim-highlight-colors").setup()
-- colorscheme / theme
vim.cmd("colorscheme tokyonight-moon")

-- require("bufferline").setup({
--     options = {
--         mode = "buffers",
--     },
-- })

require("nvim-tree").setup({
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
})

local BarBar = require("barbar")
BarBar.setup()

vim.keymap.set("n", "<TAB>", "<cmd>BufferNext<CR>", { desc = "Next buffer tab" })
vim.keymap.set("n", "<S-TAB>", "<cmd>BufferPrevious<CR>", { desc = "Previous buffer tab" })
vim.keymap.set("n", "<leader><TAB>", "<cmd>BufferMoveNext<CR>", { desc = "Next buffer tab" })
vim.keymap.set("n", "<leader><S-TAB>", "<cmd>BufferMovePrevious<CR>", { desc = "Previous buffer tab" })
vim.keymap.set("n", "<leader>w", "<cmd>BufferClose<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>tn", "<cmd>enew<CR>", { desc = "Open new buffer tab" })


require("lazygit")
require("neocord")
require("treesitter")
require("lsp")
