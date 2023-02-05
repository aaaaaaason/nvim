require("harpoon").setup({
    menu = {
        width = 120,
    }
})

local keymap = vim.keymap
local kopt = { silent = true, noremap = true }

keymap.set("n", "<leader>a", require("harpoon.mark").toggle_file, kopt)
keymap.set("n", "<leader>q", require("harpoon.ui").toggle_quick_menu, kopt)
keymap.set("n", "<tab>", require("harpoon.ui").nav_next, kopt)
keymap.set("n", "<S-tab>", require("harpoon.ui").nav_prev, kopt)
