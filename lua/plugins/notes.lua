return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    ft = { "markdown", "mdx" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      legacy_commands = false,

      workspaces = {
        {
          name = "notes",
          path = "~/notes",
        },
      },

      notes_subdir = "notes",
      new_notes_location = "notes_subdir",
      preferred_link_style = "wiki",

      daily_notes = {
        folder = "daily",
        date_format = "%Y-%m-%d",
        alias_format = "%B %-d, %Y",
        default_tags = { "daily" },
        template = "daily.md",
      },

      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },

      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },

      attachments = {
        img_folder = "assets/imgs",
      },

      note_frontmatter_func = function(note)
        if note.title then
          note:add_alias(note.title)
        end

        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,

      picker = {
        name = "telescope.nvim",
      },

      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ["<cr>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
        ["<leader>ch"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      },
    },
  },
}
