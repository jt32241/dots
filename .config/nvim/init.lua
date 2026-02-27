--[[ Sharkbait NVIM ]]

vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.scrolloff = 10
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.hlsearch = true
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
-- vim.o.ignorecase = true
-- vim.o.smartcase = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.winborder = 'rounded'

vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.signcolumn = 'yes'

vim.opt.textwidth = 88


-- [[ Lazy Plugins ]]
require('plugins.lazy-bootstrap')
require('lazy').setup({

  { import = "plugins.lazy" },

  {
    'tpope/vim-fugitive',
    init = function ()
      vim.cmd('cabbrev gvd Gvdiffsplit')
    end
  },
  'tpope/vim-rhubarb',
  'tpope/vim-surround',
  'tpope/vim-dispatch',
  'tpope/vim-sleuth',
  'tpope/vim-unimpaired',

}, {})


-- [[ Keybinds ]]
require("plugins.keys")


-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
