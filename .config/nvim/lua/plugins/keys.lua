-- [[ Basic Keymaps ]]
--
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('n', '<leader>hh', ':noh<cr>', { noremap = true })
vim.keymap.set('n', '<leader>ev',
  function()
    vim.cmd('edit ' .. vim.fn.stdpath('config') .. '/init.lua')
  end,
  { noremap = true, silent = true, desc = "[E]dit Config" }
)
-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>eq', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>ed', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>eQ', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('t', '<C-\\><C-\\>', '<C-\\><C-n>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>fb', vim.lsp.buf.format, { desc = 'LSP format' })

vim.keymap.set('n', '<leader>zT', function()
  vim.o.foldmethod = 'expr'
  vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
  vim.o.foldenable = true
end, { desc = 'Enable Treesitter folding'})

vim.cmd('cnoreabbrev ms lua MiniSessions')
vim.cmd('cnoreabbrev mss lua MiniSessions.select()')
vim.cmd('cnoreabbrev msw lua MiniSessions.select()')
-- vim: ts=2 sts=2 sw=2 et
