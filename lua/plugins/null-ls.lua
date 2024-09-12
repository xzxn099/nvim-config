return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.biome,
        null_ls.builtins.completion.spell,
        -- null_ls.builtins.formatting.dxfmt,
      },
    })

    vim.keymap.set("n", "<C-l>", function() 
      vim.lsp.buf.format({ async = true }) 
    end, { noremap = true, silent = true })
  end,
}


