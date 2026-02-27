return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  keys = {
    { "<C-e>", function()
        require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
      end
    },
    { "<leader>ea", function() require('harpoon'):list():add() end, desc = "harpoon add" },
    { "<leader>ee", function()
        require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
      end,
      desc = "harpoon add"
    },
    { "<C-S-P>", function() require'harpoon':list():prev() end },
    { "<C-S-N>", function() require'harpoon':list():next() end },
  }
}
-- vim: ts=2 sts=2 sw=2 et
