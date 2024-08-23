return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier.with({
					filetypes = { "javascript", "typescript", "css", "html", "json", "yaml", "markdown" }
				}),
				null_ls.builtins.formatting.rustfmt, -- For Rust
				-- Add more formatters as needed
			},
		})

		vim.keymap.set("n", "<C-l>", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true, silent = true })

	end,
}

