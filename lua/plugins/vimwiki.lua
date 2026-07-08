return {
  {
    "vimwiki/vimwiki",
    keys = {
      "<leader>ww",
      "<leader>wt",
      "<leader>wi",
    },
    event = "BufEnter *.md",

    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/vimwiki/",
          syntax = "markdown",
          ext = "md",
        },
      }

      vim.g.vimwiki_ext2syntax = {}
    end,
  },
}
