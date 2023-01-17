
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

local keymap = vim.keymap

keymap.set("n", "<C-s>", ":w!<CR>", { silent = true, noremap = true })
keymap.set("i", "<C-s>", "<Esc>:w!<CR>", { silent = true, noremap = true })
keymap.set("n", "<C-l>", ":noh<CR>", { silent = true, noremap = true })

keymap.set("n", "<A->>", "<C-W>>", { silent = true, noremap = true })
keymap.set("n", "<A-->", "<C-W>-", { silent = true, noremap = true })
keymap.set("n", "<A-+>", "<C-W>+", { silent = true, noremap = true })
keymap.set("n", "<A-<>", "<C-W><", { silent = true, noremap = true })

local cmd = vim.cmd
--cmd("colorscheme carbonfox")
--cmd("colorscheme dracula")
--cmd("colorscheme onedark")
cmd("colorscheme gruvbox")
