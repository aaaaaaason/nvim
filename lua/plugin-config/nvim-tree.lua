-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require('nvim-tree').setup {
    view = {
        mappings = {
            list = {
                -- For lightspeed
                { key = "s", action = "" },
                { key = "S", action = "" },
            },
        },
    },
    filters = {
        dotfiles = false,
    },
}

vim.keymap.set("n", "<Leader>t", ":NvimTreeFindFileToggle<CR>", { silent = true, noremap = true })
