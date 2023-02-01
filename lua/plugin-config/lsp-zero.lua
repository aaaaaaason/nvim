-- Reserve space for diagnostic icons
vim.opt.signcolumn = 'yes'

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    'bashls',
    'clangd',
    'dockerls',
    'eslint',
    'golangci_lint_ls',
    'gopls',
    'graphql',
    'html',
    'jsonls',
    'jdtls',
    'tsserver',
    'marksman',
    --'pyright',
    'jedi_language_server',
    'rust_analyzer',
    'sqlls',
    'taplo',
    'lemminx',
    'yamlls',
})

-- Pass arguments to a language server
--lsp.configure('tsserver', {
--  on_attach = function(client, bufnr)
--    print('hello tsserver')
--  end,
--  settings = {
--    completions = {
--      completeFunctionCalls = true
--    }
--  }
--})

-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

vim.cmd [[autocmd BufWritePre * if exists(":LspZeroFormat") | exe "LspZeroFormat" | endif]]
