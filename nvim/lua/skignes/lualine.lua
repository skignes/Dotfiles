local M = {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- Custom Tokyo Night colors
        local colors = {
            bg = '#1a1b26',
            fg = '#c0caf5',
            yellow = '#e0af68',
            cyan = '#7dcfff',
            green = '#9ece6a',
            orange = '#ff9e64',
            violet = '#bb9af7',
            magenta = '#ad8ee6',
            blue = '#7aa2f7',
            red = '#f7768e',
            black = '#15161e',
            white = '#a9b1d6',
        }

		-- Tokyo Night Theme
        local tokyonight = {
            normal = {
                a = { fg = colors.black, bg = colors.blue, gui = 'bold' },
                b = { fg = colors.white, bg = colors.bg },
                c = { fg = colors.white, bg = colors.bg },
            },
            insert = {
                a = { fg = colors.black, bg = colors.green, gui = 'bold' },
            },
            visual = {
                a = { fg = colors.black, bg = colors.violet, gui = 'bold' },
            },
            replace = {
                a = { fg = colors.black, bg = colors.red, gui = 'bold' },
            },
            command = {
                a = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
            },
            inactive = {
                a = { fg = colors.white, bg = colors.bg, gui = 'bold' },
                b = { fg = colors.white, bg = colors.bg },
                c = { fg = colors.white, bg = colors.bg },
            },
        }

        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = tokyonight,
				component_separators = { left = '|', right = '|'},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 10,
                    tabline = 10,
                    winbar = 10,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
}

return M
