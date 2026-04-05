return {
    { "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end,
    },
    { "williamboman/mason-lspconfig.nvim",
      config = function()
        require("mason-lspconfig").setup({
          ensure_installed = {
            "clangd",        
            "intelephense",  
            "ts_ls",         
            "html",          
            "cssls",         
            "pyright",       
          },
          automatic_installation = true,
        })
      end,
    },
    { "neovim/nvim-lspconfig",
      config = function()
        vim.lsp.enable({
          "clangd",
          "intelephense",
          "ts_ls",
          "html",
          "cssls",
          "pyright",
        })
      end,
    }
} 
