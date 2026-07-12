return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/which-key.nvim",
    },
    config = function()
      local jdtls = require("jdtls")
      local util = require("jdtls.setup")

      local root_markers = {
        ".git",
        "mvnw",
        "gradlew",
        "pom.xml",
        "build.gradle",
        "settings.gradle",
        "build.gradle.kts",
        "settings.gradle.kts",
      }

      local root_dir = util.find_root(root_markers)
      if not root_dir then
        return
      end

      local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
      local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name

      local config = {
        cmd = { vim.fn.exepath("jdtls"), "-data", workspace_dir },
        root_dir = root_dir,
        init_options = {
          bundles = {},
        },
      }

      jdtls.start_or_attach(config)
    end,
  },
}
