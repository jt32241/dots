return {
	'folke/which-key.nvim',
	event = 'VimEnter',
	opts = {
    preset = "helix",
    delay = 0,
    spec = {
        { '<leader>s', group = '[S]earch' },
				{ '<leader>f', group = '[F]ind' },
				{ '<leader>o', group = '[O]bsidian' },
				{ '<leader>e', group = '[E]rror' },
				{ '<leader>p', group = '[P]ick' },
				{ '<leader>g', group = '[G]it' },
				{ '<leader>t', group = '[T]oggles' },
				{ '<leader>c', group = '[C]ode', mode = { 'n', 'v' }},
      },
  },
}

-- vim: ts=2 sts=2 sw=2 et
