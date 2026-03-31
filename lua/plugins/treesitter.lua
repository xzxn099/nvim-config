return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
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
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })

    vim.keymap.set("n", "<leader>t", vim.lsp.buf.hover, { desc = "Show type of symbol under cursor" })

    vim.diagnostic.config({
      virtual_text = false,
    })

    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line diagnostics" })
    vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
    vim.keymap.set("n", "<leader>p", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
  end,
}
