return {
	'hrsh7th/nvim-cmp',
  event = 'VimEnter',
  disabled = true,
  enabled = false,
	dependencies = {
    { 'L3MON4D3/LuaSnip', opt = {} }, -- snippet engine
	  'saadparwaiz1/cmp_luasnip',       -- connector to cmp
	  'rafamadriz/friendly-snippets',   -- some precooked snippets
	  'hrsh7th/cmp-nvim-lsp',
	  'hrsh7th/cmp-path',
	},
	opts = function(_, opts)
	  opts.sources = opts.sources or {}
	  table.insert(opts.sources, {
		name = "lazydev",
		group_index = 0

	  })
	end,
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_lua').lazy_load({paths = { "~/.config/nvim/lua/snippets" }})

    vim.keymap.set({"i", "s"}, "<C-H>", function() luasnip.jump(-1) end, { silent= true })
    vim.keymap.set({ "i", "s" }, "<C-L>", function() luasnip.jump(1) end, { silent = true })
    vim.keymap.set(
      { "n" }, "<leader>sl",
      function() require("luasnip.extras.snippet_list").open() end,
      { silent = false, desc = "[S]nippet [L]ist" }
    )

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      },
    }
  end,
}
-- vim: ts=2 sts=2 sw=2 et
