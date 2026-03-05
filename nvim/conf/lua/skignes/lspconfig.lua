local M = {
    "neovim/nvim-lspconfig",
	opts = {},
    config = function()
        -- Setup language servers.
        local lspconfig = vim.lsp
        -- Python
        lspconfig.config('pylsp', {})
        -- Bash
        lspconfig.config('bashls', {})
        -- Rust
        lspconfig.config('rust_analyzer', {})
        -- Js && Typescript
        lspconfig.config('ts_ls', {})
        -- Css
        lspconfig.config('cssls', {})
        -- Haskell
        lspconfig.config('hls', {
          cmd = { "/run/current-system/sw/bin/haskell-language-server-9.8.4", "--lsp" }
        })
        -- Assembly
        lspconfig.config('asm_lsp', {})
        -- Html
        lspconfig.config('html', {})
        -- Vuejs
        lspconfig.config('vuels', {})
        -- Yaml
        lspconfig.config('yamlls', {})
        -- Json
        lspconfig.config('jsonls', {})
        -- Ansible
        lspconfig.config('ansiblels', {})
        -- Prisma
        lspconfig.config('prismals', {})
        -- Tailwindcss
        lspconfig.enable('tailwindcss', {})
        -- Docker
        lspconfig.enable('docker_language_server', {})
        -- Terraform
        lspconfig.enable('terraform-ls', {})

        -- C
        lspconfig.config('clangd', {
          cmd = { "clangd", "--background-index" }, -- Adjust the command as necessary
          filetypes = { "c", "cpp" }, -- Set the filetypes you want clangd to handle
        })

        -- Lua
        lspconfig.config('lua_ls', {
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
                    telemetry = {
                        enable = false,  -- Disable telemetry if you prefer
                    },
                },
            },
        })


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
