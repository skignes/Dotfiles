local M = {
    "nvim-treesitter/nvim-treesitter",
	opts = {},
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = {
			  "c",
			  "cpp",
			  "c_sharp",
			  "python",
			  "bash",
			  "yaml",
			  "json",
			  "lua",
			  "vim",
			  "html",
			  "javascript",
			  "typescript",
			  "css",
			  "scss",
			  "vue"
		  },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
}

return M
