local M = {}

-- Tokyo Night
table.insert(M, {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        vim.cmd.colorscheme "tokyonight-night"
    end,
})

return M
