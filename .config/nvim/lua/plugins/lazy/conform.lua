return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylelua" },
      python = { "isort", "black" },
      rust = { "rustfmt", lsp_format = "fallback" },
    },
    format_on_save = false,
    format_after_save = false,
  },
  keys = {
    { "<Leader>ef",
    function()
      -- vim.lsp.buf.format()
      require("conform").format({ lsp_fallback = true })
    end,
    desc = "format"
    },
  },
}
--- vim: ts=2 sts=2 sw=2 et
