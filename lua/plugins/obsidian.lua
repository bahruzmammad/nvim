return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "blog",
          path = "~/blog",
        },
      },

      notes_subdir = "notes",

      daily_notes = {
        folder = "daily",
        date_format = "%Y-%m-%d",
        alias_format = "%B %d, %Y",
      },

      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },

      new_notes_location = "notes_subdir",

      preferred_link_style = "wiki",

      ui = {
        enable = true,
      },
    },
  },
}
