return {
  -- big boi mini
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.ai').setup()
    require('mini.statusline').setup()
    -- require('mini.tabline').setup()
    require('mini.extra').setup()
    require('mini.files').setup()
    require('mini.pairs').setup()
    require('mini.pick').setup()
    require('mini.comment').setup()
    require('mini.move').setup()
    require('mini.icons').setup()
    -- require('mini.trailspace').setup()
    require('mini.bufremove').setup()
    require('mini.sessions').setup({ verbose = { read = true, write = true, delete = true }})
    require('mini.splitjoin').setup()
    require('mini.git').setup()

    vim.api.nvim_create_user_command('TrimSpaces', function() require('mini.trailspace').trim() end, {})
    vim.api.nvim_create_user_command('BD', function() require('mini.bufremove').delete() end, {})
  end,
  keys = {
    { '<leader>pe', require('mini.files').open, desc = "explorer", mode = 'n' },
    {
      '<leader>pE',
      function()
        require('mini.files').open(vim.fn.expand('%:p:h'))
      end,
      desc = "explorer (%:p:h)",
      mode = 'n'
    },
    { '<leader>pf', ':Pick files<CR>',          mode = 'n' },
    { '<leader>pb', ':Pick buffers<CR>',        mode = 'n' },
    { '<leader>pg', ':Pick grep<CR>',           mode = 'n' },
    { '<leader>pG', ':Pick grep_live<CR>',      mode = 'n' },
    { '<leader>p.', ':Pick resume<CR>',         mode = 'n' },
  }
}
-- vim: ts=2 sts=2 sw=2 et
