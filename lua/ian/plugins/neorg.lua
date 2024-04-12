return {
  "nvim-neorg/neorg",
  dependencies = { "luarocks.nvim" },
  lazy = false,
  version = "*",
  config = function()
    require("neorg").setup({
      ["core.defaults"] = {},
      ["core.norg.concealer"] = {},
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            notes = "~/Neorg",
          },
        },
      },
    })
  end,
}
