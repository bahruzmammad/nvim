return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "md", "mdx" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
  },

  {
    "OXY2DEV/markview.nvim",
    ft = { "markdown", "md", "mdx" },
    lazy = true,
  },

  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        dir_path = "images",
        relative_to_current_file = true,
        prompt_for_file_name = false,
      },
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown", "md", "mdx" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_theme = "dark"
      vim.g.mkdp_filetypes = { "markdown", "md", "mdx" }
    end,
  },
}
