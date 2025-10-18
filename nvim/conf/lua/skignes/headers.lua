local M = {
    "lg-epitech/headers.nvim",

    opts = {
        email = "charly.palliere@epitech.eu", -- Defaults to undefined
        username = "skignes", -- Defaults to undefined
    },

    config = function(opts)
        -- Setup
        require("headers").setup(opts.opts)

        -- Keymaps
        vim.keymap.set(
            "n",
            "<leader>i",
            ":InsertSelectedHeader<CR>",
            { noremap = true, silent = true }
        )

        vim.keymap.set(
            "n",
            "<leader>h",
            ":Headers<CR>",
            { noremap = true, silent = true }
        )

        -- Config
        local templates = require("headers.templates")

        templates.add(
            "tek", -- Name
            "EPITECH PROJECT, %yyyy\n%g\nFile description:\n%grp", -- Text
            { padding = 1, separation = " " } -- Options
        )
        templates.select("tek")
    end,
}

return M
