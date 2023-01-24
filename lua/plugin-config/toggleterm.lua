
require 'toggleterm'.setup({
	size = 20,
	open_mapping = [[<leader>a]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'kj', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local keymap = vim.keymap
local kopt = { silent = true, noremap = true }
keymap.set("n", "<leader>1", "<cmd>1ToggleTerm<CR>", kopt)
keymap.set("t", "<leader>1", "<cmd>1ToggleTerm<CR>", kopt)
keymap.set("n", "<leader>2", "<cmd>2ToggleTerm<CR>", kopt)
keymap.set("t", "<leader>2", "<cmd>2ToggleTerm<CR>", kopt)
keymap.set("n", "<leader>3", "<cmd>3ToggleTerm<CR>", kopt)
keymap.set("t", "<leader>3", "<cmd>3ToggleTerm<CR>", kopt)
keymap.set("n", "<leader>4", "<cmd>4ToggleTerm<CR>", kopt)
keymap.set("t", "<leader>4", "<cmd>4ToggleTerm<CR>", kopt)

