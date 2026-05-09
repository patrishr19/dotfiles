local caps = vim.lsp.protocol.make_client_capabilities()
if pcall(require, "cmp_nvim_lsp") then
    caps = require("cmp_nvim_lsp").default_capabilities()
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local buf = args.buf
        local map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = buf })
        end

        map('n', 'K',             vim.lsp.buf.hover)
        map('n', 'gd',            vim.lsp.buf.definition)
        map('n', 'gD',            vim.lsp.buf.declaration)
        map('n', 'gi',            vim.lsp.buf.implementation)
        map('n', 'gr',            vim.lsp.buf.references)
	map('n', 'gl', vim.diagnostic.open_float)
        map('n', '<F2>',          vim.lsp.buf.rename)
        map('n', '<F4>',          vim.lsp.buf.code_action)
        map({ 'n', 'x' }, '<F3>', function()
            vim.lsp.buf.format({ async = true })
        end)
    end,
})

-- PHP
vim.lsp.config['intelephense'] = {
    cmd = { 'intelephense', '--stdio' },
    filetypes = { 'php' },
    root_markers = { 'composer.json', '.git' },
    capabilities = caps,
    settings = {
        intelephense = {
            stubs = {
                "apache", "bcmath", "bz2", "calendar", "Core", "ctype",
                "curl", "date", "dom", "fileinfo", "filter", "gd", "hash",
                "iconv", "json", "libxml", "mbstring", "mysqli", "openssl",
                "pcre", "PDO", "pdo_mysql", "Phar", "posix", "Reflection",
                "session", "SimpleXML", "soap", "sockets", "SPL", "sqlite3",
                "standard", "tokenizer", "xml", "xmlreader", "xmlwriter",
                "zip", "zlib",
                "wordpress"
            },
            environment = {
                includePaths = {
                    "./vendor/php-stubs/wordpress-stubs"
                }
            }
        }
    }
}

-- C / C++
vim.lsp.config['clangd'] = {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp' },
    root_markers = { 'compile_commands.json', 'Makefile', '.git' },
    capabilities = caps,
}

-- Lua
vim.lsp.config['lua_ls'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.git' },
    capabilities = caps,
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file('', true),
            },
        },
    },
}

-- HTML
vim.lsp.config['html'] = {
    cmd = { 'vscode-html-language-server', '--stdio' },
    filetypes = { 'html', 'blade'},
    root_markers = { 'package.json', '.git' },
    capabilities = caps,
}

-- CSS
vim.lsp.config['cssls'] = {
    cmd = { 'vscode-css-language-server', '--stdio' },
    filetypes = { 'css', 'scss' },
    root_markers = { 'package.json', '.git' },
    capabilities = caps,
}

-- JavaScript
vim.lsp.config['ts_ls'] = {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
    root_markers = { 'package.json', '.git' },
    capabilities = caps,
}

-- Python
vim.lsp.config['pyright'] = {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'requirements.txt', '.git' },
    capabilities = caps,
    settings = {
	python = {
	    analysis = {
		typeCheckingMode = "off",
	    },
	},
    },
}

vim.filetype.add({
    pattern = {
	['.*%.blade%.php'] = 'blade',
    },
})


vim.lsp.enable({ 'intelephense', 'clangd', 'lua_ls', 'html', 'cssls', 'ts_ls', 'pyright' })
