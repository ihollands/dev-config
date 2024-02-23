return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    local utils = require("telescope.utils")

    local trouble = require("trouble.providers.telescope")

    telescope.setup({
      file_ignore_patterns = {
        "node_modules",
      },
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<C-t"] = trouble.open_with_trouble,
          },
          n = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<C-t"] = trouble.open_with_trouble,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    local function call_builtin(method, options)
      builtin[method](options)
    end

    keymap.set("n", "<leader>ff", function()
      call_builtin("find_files", { hidden = true })
    end, { desc = "Fuzzy find files" })
    keymap.set("n", "<leader>fj", function()
      call_builtin("find_files", { cwd = utils.buffer_dir(), hidden = true })
    end, { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", function()
      call_builtin("oldfiles", { hidden = true })
    end, { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", function()
      call_builtin("live_grep")
    end, { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fk", function()
      call_builtin("live_grep", { cwd = utils.buffer_dir() })
    end, { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", function()
      call_builtin("grep_string")
    end, { desc = "Find string under cursor in cwd" })
  end,
}
