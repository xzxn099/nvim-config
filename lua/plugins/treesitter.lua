return {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function () 
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		ensure_installed = {"lua", "query", "javascript", "html", "css", "typescript", "rust", "sql", "markdown", "markdown_inline"},
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },  
	})

  -- add type displaying keybinging
  vim.keymap.set("n", "<leader>t", vim.lsp.buf.hover, { desc = "Show type of symbol under cursor" })

  -- update diagnostics (errors) display:
  vim.diagnostic.config({
    virtual_text = false, -- Turn off inline diagnostics
  })

  -- Show all diagnostics on current line in floating window
  vim.api.nvim_set_keymap(
    'n', '<Leader>d', ':lua vim.diagnostic.open_float()<CR>', 
    { noremap = true, silent = true }
  )

  -- Go to next diagnostic (if there are multiple on the same line, only shows
  -- one at a time in the floating window)
  vim.api.nvim_set_keymap(
    'n', '<Leader>n', ':lua vim.diagnostic.goto_next()<CR>',
    { noremap = true, silent = true }
  )

  -- Go to prev diagnostic (if there are multiple on the same line, only shows
  -- one at a time in the floating window)
  vim.api.nvim_set_keymap(
    'n', '<Leader>p', ':lua vim.diagnostic.goto_prev()<CR>',
    { noremap = true, silent = true }
  )
end}


