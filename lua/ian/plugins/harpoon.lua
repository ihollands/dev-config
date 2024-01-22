return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local harpoon = require("harpoon")

    harpoon:setup()

    local keys = {
      {
        "a",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        "Toggle harpoon menu",
      },
      {
        "m",
        function()
          harpoon:list():append()
        end,
        "Mark file with harpoon",
      },
      {
        "n",
        function()
          harpoon:list():next()
        end,
        "Go to next harpoon",
      },
      {
        "p",
        function()
          harpoon:list():prev()
        end,
        "Go to prev harpoon",
      },
      {
        "h",
        function()
          harpoon:list():select(1)
        end,
        "Go to harpoon 1",
      },
      {
        "j",
        function()
          harpoon:list():select(2)
        end,
        "Go to harpoon 2",
      },
      {
        "k",
        function()
          harpoon:list():select(3)
        end,
        "Go to harpoon 3",
      },
      {
        "l",
        function()
          harpoon:list():select(4)
        end,
        "Go to harpoon 4",
      },
    }

    for i, value in ipairs(keys) do
      local keySequence = string.format("<leader>h%s", value[1])

      keymap.set("n", keySequence, value[2], { desc = value[3] })
    end
  end,
}
