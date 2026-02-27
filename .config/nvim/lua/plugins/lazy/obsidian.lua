return {
	-- "epwalsh/obsidian.nvim",
	"obsidian-nvim/obsidian.nvim",
	version = "*",  -- recommended, use latest release instead of latest commit
	lazy = true,
	keys = {
		{ "<leader>oo", "<cmd>Obsidian quick_switch<CR>", desc = "Obsidian Quick Switch" },
		{ "<leader>os", "<cmd>Obsidian search<CR>", desc = "Obsidian Search" },

		{ '<leader>or', ':Obsidian rename<CR>', desc = 'Obsidian: Rename note', mode = 'n' },
		{ '<leader>ox', ':Obsidian extract_note<CR>', desc = 'Obsidian: Extract selection to new note', mode = 'v' },
		{ '<leader>ol', ':Obsidian link<CR>', desc = 'Obsidian: Add link to note', mode = 'n' },
		{ '<leader>ot', ':Obsidian tags ', desc = 'Obsidian: tags', mode = 'n' },
		{ '<leader>oy', ':Obsidian yesterday<CR>', desc = 'Obsidian: Open/create yesterday note', mode = 'n' },
		{ '<leader>of', ':Obsidian quick_switch<CR>', desc = 'Obsidian: Quick switch to note', mode = 'n' },
		{ '<leader>ob', ':Obsidian backlinks<CR>', desc = 'Obsidian: Show backlinks', mode = 'n' },
		{ '<leader>on', ':Obsidian new<CR>', desc = 'Obsidian: Create new note', mode = 'n' },
	},
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
	  -- Required.
	 "nvim-lua/plenary.nvim",
	},
  init = function()
    vim.cmd('cabbrev obsi Obsidian')
  end,
	opts = {
    picker = {
      name = "snacks.pick",
    },
	  ui = { enable = false },
    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
    },
	  workspaces = {
		{
		  name = "personal",
		  path = "~/vaults/personal",
		},
		{
		  name = "work",
		  path = "~/vaults/work",
		},
    {
      name = "personal-smb",
      path = "/mnt/smb/vault/personal",
    },
	  },
	},
}
-- vim: ts=2 sts=2 sw=2 et
