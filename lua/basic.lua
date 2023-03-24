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
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.completeopt = { "menuone", "noselect" }

local keymap = vim.keymap
local kopt = { silent = true, noremap = true }

-- Grep
vim.cmd [[ set grepprg=rg\ --vimgrep\ --hidden\ --glob\ \"!.git\"\ --follow\ ]]
keymap.set("n", "<leader>g", ":silent grep ", { silent = false })

-- Regs
keymap.set("n", "<leader>r", ":reg<CR>", { silent = false })

keymap.set("n", "<C-s>", ":w!<CR>", kopt)
keymap.set("i", "<C-s>", "<Esc>:w!<CR>", kopt)
keymap.set("n", "<C-c>", ":noh<CR>", kopt)
--keymap.set("n", "<esc><esc>", ":qa!<CR>", kopt)

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", kopt)
keymap.set("n", "<C-j>", "<C-w>j", kopt)
keymap.set("n", "<C-k>", "<C-w>k", kopt)
keymap.set("n", "<C-l>", "<C-w>l", kopt)

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize -2<CR>", kopt)
keymap.set("n", "<C-Down>", ":resize +2<CR>", kopt)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", kopt)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", kopt)

-- Press jk fast to exit insert mode
keymap.set("i", "jk", "<ESC>", kopt)
keymap.set("i", "kj", "<ESC>", kopt)

-- Toggle quickfix results
keymap.set("n", "<S-j>", "<cmd>cn<CR>", kopt)
keymap.set("n", "<S-k>", "<cmd>cp<CR>", kopt)

-- Paste behaviors
--keymap.set("x", "p", "P", kopt) -- not to copy virtual mode selected text
--keymap.set("n", "p", "\"0p", kopt)
--keymap.set("n", "P", "\"0P", kopt)

local cmd = vim.cmd
--cmd("colorscheme carbonfox")
--cmd("colorscheme dracula")
--cmd("colorscheme onedark")
--cmd("colorscheme solarized")
--cmd("colorscheme gruvbox")
--cmd("colorscheme ayu")
cmd("colorscheme vscode")
