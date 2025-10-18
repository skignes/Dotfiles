local M = {}

-- Tokyo Night
table.insert(M, {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        vim.cmd.colorscheme "tokyonight-moon"
    end,
})

-- Catppuccin
table.insert(M, {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
})

table.insert(M, {
    "NLKNguyen/papercolor-theme",
    name = "papercolor",
    priority = 1000,
})

return M
