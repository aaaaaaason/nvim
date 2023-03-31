-- Reserve space for diagnostic icons
vim.opt.signcolumn = 'yes'

-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#minimal
local lsp = require('lsp-zero').preset('lsp-only')

local cmp = require('cmp')
local cmp_action = lsp.cmp_action()
local select_opts = { behavior = 'select' }

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer', keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Esc>'] = cmp.mapping.abort(),
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                cmp.complete()
            end
        end),
        ['<C-n>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item(select_opts)
            else
                cmp.complete()
            end
        end),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    }
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({
        buffer = bufnr,
    })
    lsp.buffer_autoformat()
end)

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
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

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- vim.cmd [[autocmd BufWritePre * if exists(":LspZeroFormat") | exe "LspZeroFormat" | endif]]
