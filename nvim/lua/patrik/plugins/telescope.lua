return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<C-p>', function()
      builtin.find_files({ cwd = vim.fn.getcwd() })
    end, {})
    vim.keymap.set('n', '<leader>fg', function()
      builtin.live_grep({ cwd = vim.fn.getcwd() })
    end, {})
  end,
}
