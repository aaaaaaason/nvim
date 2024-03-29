require("harpoon").setup({
    menu = {
        width = 120,
    }
})

local keymap = vim.keymap
local kopt = { silent = true, noremap = true }

keymap.set("n", "m", require("harpoon.mark").toggle_file, kopt)
keymap.set("n", "<leader>h", require("harpoon.ui").toggle_quick_menu, kopt)
keymap.set("n", "<s-h>", require("harpoon.ui").nav_next, kopt)
keymap.set("n", "<s-l>", require("harpoon.ui").nav_prev, kopt)
