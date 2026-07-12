return {
  {
    "hat0uma/csvview.nvim",
    ft = { "csv" },
    opts = {},
  },

  {
    "nvim-neorg/neorg",
    ft = "norg",
    opts = {
      load = {
        ["core.defaults"] = {},
      },
    },
  },

  {
    "kkoomen/vim-doge",
    build = ":call doge#install()",
  },

  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },
}
