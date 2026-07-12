return {
  {
    "davidmh/mdx.nvim",
    ft = { "markdown", "mdx" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
  },

  {
    "HakonHarnes/img-clip.nvim",
    ft = { "markdown", "mdx" },
    keys = {
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image" },
    },
    opts = {
      default = {
        dir_path = "assets/images",
        relative_to_current_file = true,
        prompt_for_file_name = false,
        template = "![$CURSOR]($FILE_PATH)",
      },
      filetypes = {
        markdown = {
          template = "![$CURSOR]($FILE_PATH)",
        },
        mdx = {
          template = "![$CURSOR]($FILE_PATH)",
        },
      },
    },
  },
}
