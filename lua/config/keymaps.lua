-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Zen Mode" })
vim.keymap.set("n", "<leader>tw", "<cmd>Twilight<CR>", { desc = "Twilight" })
vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { desc = "Markdown Preview" })
vim.keymap.set("n", "<leader>mr", "<cmd>RenderMarkdown toggle<CR>", { desc = "Render Markdown" })

local tb = require("telescope.builtin")

vim.keymap.set("n", "<leader>mf", function()
  tb.find_files({
    prompt_title = "Markdown and MDX",
    find_command = { "rg", "--files", "-g", "*.md", "-g", "*.mdx" },
  })
end, { desc = "Markdown files" })

vim.keymap.set("n", "<leader>mg", function()
  tb.live_grep({
    prompt_title = "Markdown and MDX grep",
    additional_args = function()
      return { "--glob", "*.md", "--glob", "*.mdx" }
    end,
  })
end, { desc = "Markdown grep" })

local function git_commit_push()
  vim.cmd("silent write")
  local msg = vim.fn.input("Commit message: ")
  if msg == "" then
    return
  end

  local function run(cmd)
    local out = vim.fn.system(cmd)
    if vim.v.shell_error ~= 0 then
      error((out or ""):gsub("%s+$", ""))
    end
  end

  local ok, err = pcall(function()
    run({ "git", "add", "-A" })
    run({ "git", "commit", "-m", msg })
    run({ "git", "push" })
  end)

  if not ok then
    vim.notify(err, vim.log.levels.ERROR)
    return
  end

  vim.notify("Committed and pushed")
end

vim.keymap.set("n", "<leader>gp", git_commit_push, { desc = "Commit and push" })
