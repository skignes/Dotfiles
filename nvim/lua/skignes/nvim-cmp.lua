local M = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },
    config = function()
        local cmp = require'cmp'
		vim.o.pumheight = 6
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, {"i", "s"}),
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = {
                { name = 'nvim_lsp' },
				{ name = 'luasnip' },
            },
            formatting = {
                format = require("lspkind").cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50,
                }),
            },
			-- experimental = {
                -- ghost_text = true,
            -- },
        })
		cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
              { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
            }, {
              { name = 'buffer' },
            })
          })

          -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
          cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = 'buffer' }
            }
          })

          -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
          cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
              { name = 'path' }
            }, {
              { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
          })
    end
}

return M
