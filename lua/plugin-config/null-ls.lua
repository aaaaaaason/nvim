
null_ls = require 'null-ls'

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local f = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local d = null_ls.builtins.diagnostics

local c = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
        c.gomodifytags,

        d.golangci_lint,

        f.stylua,
        f.gofmt,
        f.goimports,
	},
})
