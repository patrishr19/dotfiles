return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ":TSUpdate",
    config = function()
	require('nvim-treesitter').setup({
	    install_dir = vim.fn.stdpath('data') .. '/site',
	})

	require('nvim-treesitter').install({ 'lua', 'c', 'php', 'markdown', 'javascript', 'python', 'blade', 'css', 'html'})

	vim.api.nvim_create_autocmd('FileType', {
	    pattern = { 'lua', 'c', 'javascript', 'php', 'markdown', 'python' },
	    callback = function() vim.treesitter.start() end,
	})

	vim.api.nvim_create_autocmd('FileType', {
	    pattern = { 'lua', 'c', 'javascript', 'php', 'markdown', 'python' },
	    callback = function()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	    end,
	})

	vim.treesitter.language.register('html', 'blade')
    end
}
