return {
	"olimorris/codecompanion.nvim",
	keys = {
	  { '<leader>ct', ':CodeCompanionChat toggle<CR>', desc= ':CodeCompanionChat toggle', mode = { 'n', 'v' }},
	  { '<leader>cc', ':CodeCompanionChat ', desc= ':CodeCompanionChat', mode = { 'n', 'v' }},
	  { '<leader>co', ':CodeCompanion ', desc= ':CodeCompanion', mode = { 'n', 'v' }},
	},
  init = function()
    vim.cmd('cnoreabbrev cc CodeCompanion')
  end,
	opts = {
	  strategies = {
		chat = { adapter = "anthropic" },
		inline = { adapter = "anthropic" },
	  },
	  adapters = {
      http = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
          env = {
            api_key = "ANTHROPIC_API_KEY"
          },
          schema = {
            model = {
            default = "claude-3-5-haiku-20241022",
            },
          },
          })
        end,
      },
    },
	},
	dependencies = {
	  "nvim-lua/plenary.nvim",
	  "nvim-treesitter/nvim-treesitter",
	},
}

-- vim: ts=2 sts=2 sw=2 et
