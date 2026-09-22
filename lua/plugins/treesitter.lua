return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local treesitter = require("nvim-treesitter")

    treesitter.setup()

    treesitter.install({
      "lua",
      "query",
      "javascript",
      "html",
      "css",
      "typescript",
      "rust",
      "sql",
      "markdown",
      "markdown_inline",
      "swift",
      "prisma",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "lua",
        "javascript",
        "html",
        "css",
        "typescript",
        "rust",
        "sql",
        "markdown",
        "swift",
        "prisma",
      },
      callback = function()
        vim.treesitter.start()
      end,
    })

    vim.keymap.set("n", "<leader>t", vim.lsp.buf.hover, {
      desc = "Show type of symbol under cursor",
    })

    vim.diagnostic.config({
      virtual_text = false,
    })

    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
      desc = "Line diagnostics",
    })

    vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, {
      desc = "Next diagnostic",
    })

    vim.keymap.set("n", "<leader>p", vim.diagnostic.goto_prev, {
      desc = "Previous diagnostic",
    })
  end,
}
