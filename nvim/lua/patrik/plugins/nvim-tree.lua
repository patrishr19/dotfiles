return { "nvim-tree/nvim-tree.lua",
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
    }
