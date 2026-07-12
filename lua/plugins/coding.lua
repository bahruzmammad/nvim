return {
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
  },

  {
    "stevearc/aerial.nvim",
    opts = {},
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "tsx",
      "jsx",
      "vue",
      "svelte",
    },
    opts = {},
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {},
  },
}
