
local opt = vim.opt

opt.number = true
opt.compatible = false
opt.hlsearch = true
opt.incsearch = true
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.autoindent = true
opt.swapfile = false
opt.cursorline = true
opt.mouse='a'

vim.keymap.set("n", "<leader>s", ":w!<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-l>", ":noh<CR>", { silent = true, noremap = true })

vim.keymap.set("n", "<A->>", "<C-W>>", { silent = true, noremap = true })
vim.keymap.set("n", "<A-->", "<C-W>-", { silent = true, noremap = true })
vim.keymap.set("n", "<A-+>", "<C-W>+", { silent = true, noremap = true })
vim.keymap.set("n", "<A-<>", "<C-W><", { silent = true, noremap = true })

--vim.cmd("colorscheme carbonfox")
--vim.cmd("colorscheme dracula")
--vim.cmd("colorscheme onedark")
vim.cmd("colorscheme gruvbox")

