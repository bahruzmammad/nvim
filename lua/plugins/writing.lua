return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {},
  },

  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
