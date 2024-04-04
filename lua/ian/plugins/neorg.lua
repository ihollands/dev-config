return {
  "nvim-neorg/neorg",
  dependencies = { "luarocks.nvim" },
  build = ":Neorg sync-parsers",
  lazy = false,
  version = "*",
  cmd = "Neorg", -- lazy load on command
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
          },
        },
      },
    })
  end,
}
