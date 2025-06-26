local M = {
    "williamboman/mason-lspconfig.nvim",
	opts = {},
    config = function()
        require("mason-lspconfig").setup({
            automatic_installation = true,
            ensure_installed = {
                "pylsp",
                "bashls",
                "rust_analyzer",
                "ts_ls",
                "cssls",
                "hls",
                "asm_lsp",
                "html",
                "vuels",
                "yamlls",
                "jsonls",
                "ansiblels",
                "clangd",
                "lua_ls",
            }
        })
    end
}

return M
