return{
  'Mofiqul/vscode.nvim',
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'tokyonight-night'
    end
  },
}
-- vim: ts=2 sts=2 sw=2 et
