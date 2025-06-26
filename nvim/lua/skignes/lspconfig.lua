local M = {
    "neovim/nvim-lspconfig",
	opts = {},
    config = function()
        -- Setup language servers.
        local lspconfig = require('lspconfig')
        -- Python
        lspconfig.pylsp.setup{}
        -- Bash
        lspconfig.bashls.setup {}
        -- Rust
        lspconfig.rust_analyzer.setup {}
        -- Js && Typescript
        lspconfig.ts_ls.setup {}
        -- Css
        lspconfig.cssls.setup{}
        -- Haskell
        lspconfig.hls.setup{}
        -- Assembly
        lspconfig.asm_lsp.setup{}
        -- Html
        lspconfig.html.setup{}
        -- Vuejs
        lspconfig.vuels.setup{}
        -- Yaml
        lspconfig.yamlls.setup{}
        -- Json
        lspconfig.jsonls.setup{}
        -- Ansible
        lspconfig.ansiblels.setup{}

        -- C
        lspconfig.clangd.setup {
          cmd = { "clangd", "--background-index" }, -- Adjust the command as necessary
          filetypes = { "c", "cpp" }, -- Set the filetypes you want clangd to handle
        }

        -- Lua
        lspconfig.lua_ls.setup {
        settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                globals = { 'vim' }, -- Specify global variables
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
        },}


        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set('n', '<space>d', vim.diagnostic.open_float)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
		-- NOTE: Change this shit
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('UserLspConfig', {}),
          callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opts = { buffer = ev.buf }
			-- NOTE: TO KEEP
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			-- NOTE: IDK
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          end,
        })
    end
}

return M
