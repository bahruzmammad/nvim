return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/which-key.nvim",
    },
    config = function()
      local ok_jdtls, jdtls = pcall(require, "jdtls")
      local ok_setup, util = pcall(require, "jdtls.setup")
      if not ok_jdtls or not ok_setup then
        return
      end

      local root_markers = {
        ".git",
        "mvnw",
        "gradlew",
        "pom.xml",
        "build.gradle",
        "build.gradle.kts",
        "settings.gradle",
        "settings.gradle.kts",
      }

      local root_dir = util.find_root(root_markers)
      if not root_dir then
        root_dir = vim.fn.getcwd()
      end

      local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
      local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name

      local cmd = { vim.fn.exepath("jdtls"), "-data", workspace_dir }
      if cmd[1] == nil or cmd[1] == "" then
        return
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      jdtls.start_or_attach({
        cmd = cmd,
        root_dir = root_dir,
        capabilities = capabilities,
        settings = {
          java = {
            eclipse = {
              downloadSources = true,
            },
            maven = {
              downloadSources = true,
            },
            completion = {
              importOrder = {
                "java",
                "javax",
                "org",
                "com",
              },
              favoriteStaticMembers = {
                "org.junit.Assert.*",
                "org.junit.jupiter.api.Assertions.*",
              },
            },
            signatureHelp = {
              enabled = true,
            },
            referencesCodeLens = {
              enabled = true,
            },
          },
        },
        init_options = {
          bundles = {},
        },
        on_attach = function(client, bufnr)
          local group = vim.api.nvim_create_augroup("java_jdtls_" .. bufnr, { clear = true })

          vim.api.nvim_create_autocmd("BufWritePre", {
            group = group,
            buffer = bufnr,
            callback = function()
              pcall(vim.cmd, "JdtOrganizeImports")
              vim.lsp.buf.format({
                bufnr = bufnr,
                async = false,
                timeout_ms = 3000,
                filter = function(format_client)
                  return format_client.name == "jdtls"
                end,
              })
            end,
          })

          local opts = { buffer = bufnr, silent = true }

          vim.keymap.set("n", "<leader>jo", "<cmd>JdtOrganizeImports<CR>", opts)
          vim.keymap.set("n", "<leader>ji", "<cmd>JdtImportType<CR>", opts)

          if client.server_capabilities.documentFormattingProvider then
            vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr()"
          end
        end,
      })
    end,
  },
}
