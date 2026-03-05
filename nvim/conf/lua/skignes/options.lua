vim.opt.showmode = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showtabline = 1
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.o.scrolloff = 8
-- Make the column stay as column
vim.o.wrap = false

-- Deactivate the mouse
vim.opt.mouse = ""
vim.opt.mousescroll = "ver:0,hor:0"

-- Make MDX file markdown
vim.cmd [[
  augroup filetypedetect
    autocmd!
    autocmd BufRead,BufNewFile *.mdx set filetype=markdown
  augroup END
]]

-- Make TF file terraform
vim.cmd [[
  augroup filetypedetect
    autocmd!
    autocmd BufRead,BufNewFile *.tf set filetype=terraform
  augroup END
]]
