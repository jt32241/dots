return {
	'vimwiki/vimwiki',
	init = function()
	  vim.g.vimwiki_global_ext = 0
	  vim.g.vimwiki_list = {{
		path = "~/vimwiki/",
		-- syntax = "markdown",
		-- ext = ".md",
		auto_toc = 1,
		auto_export= 0,
		html_template = "$HOME/vimwiki/templates/def_template.tpl",
		ext2syntax= {
		  [".md"] = "markdown",
		  [".vimwiki"] = "vimwiki"
		},
	  }}
	end,
	config = function()
		vim.keymap.set(
		  'n', '<leader>vx', ':w|Vimwiki2HTML<CR><CR>',
		  { desc = 'wiki html' }
		)
	end,
}
-- vim: ts=2 sts=2 sw=2 et
