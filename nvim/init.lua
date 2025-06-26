require("skignes.launch")
-- All key Remap
require("skignes.keymaps")
-- All the options for nvim
require("skignes.options")
require("skignes.autocmds")

-- Plugins list
SpecList "skignes.colorschemes"
Spec "skignes.telescope"
Spec "skignes.treesitter"
Spec "skignes.undotree"
Spec "skignes.autopairs"
Spec "skignes.lualine"
Spec "skignes.markdown"
Spec "skignes.move"
Spec "skignes.gitsigns"
Spec "skignes.comment"
Spec "skignes.illuminate"
Spec "skignes.harpoon"
Spec "skignes.presence"
Spec "skignes.trouble"
Spec "skignes.headers"
Spec "skignes.lazygit"
Spec "skignes.cloak"
Spec "skignes.markdown-preview"

-- Nice comment highlights
Spec "skignes.todocomments"

-- For tmux support
Spec "skignes.tmux"

-- Better file tree
Spec "skignes.oil"

-- Lsp configuration
Spec "skignes.lspconfig"
Spec "skignes.mason"
Spec "skignes.mason-lspconfig"
Spec "skignes.cmp-buffer"
Spec "skignes.cmp-cmdline"
Spec "skignes.cmp-path"
Spec "skignes.nvim-cmp"
Spec "skignes.cmp-nvim-lsp"
Spec "skignes.luasnip"

-- Plugins manager
require("skignes.lazy")
