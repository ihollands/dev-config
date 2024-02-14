return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    height = 20,
    mode = "quickfix",
    cycle_results = false,
  },
  config = function()
    local keymap = vim.keymap
    local trouble = require("trouble")

    -- quickfix
    keymap.set("n", "<leader>xf", function()
      vim.ui.input({ prompt = "Search: " }, function(searchInput)
        vim.ui.input({ prompt = "Scope: " }, function(scopeInput)
          vim.cmd.vim(string.format("/%s/j", searchInput), scopeInput)
          trouble.open("quickfix")
        end)
      end)
    end, { desc = "Build quickfix list via search" })

    keymap.set("n", "<leader>xx", function()
      trouble.toggle("quickfix")
    end)
    keymap.set("n", "<leader>xw", function()
      trouble.toggle("workspace_diagnostics")
    end)
    keymap.set("n", "<leader>xd", function()
      trouble.toggle("document_diagnostics")
    end)
    keymap.set("n", "<leader>xq", function()
      trouble.toggle("quickfix")
    end)
    keymap.set("n", "<leader>xl", function()
      trouble.toggle("loclist")
    end)
    keymap.set("n", "<leader>xg", function()
      trouble.toggle("lsp_references")
    end)
  end,
}
