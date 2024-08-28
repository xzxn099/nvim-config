return {
  {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x', config = function()
    local lsp_zero = require('lsp-zero')

    require("mason").setup()
    require("mason-lspconfig").setup()

    local lsp_attach = function(client, bufnr)
      local opts = {buffer = bufnr}

      vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
      vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
      vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
      vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
      vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
      vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

      vim.lsp.inlay_hint.enable(true, { 0 })
      -- if client.server_capabilities.inlayHintProvider then
      --   vim.lsp.inlay_hint(bufnr, true) 
      -- end
    end

    lsp_zero.extend_lspconfig({
      sign_text = true,
      lsp_attach = lsp_attach,
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })

    require('lspconfig').rust_analyzer.setup({
      settings = {
        ['rust-analyzer'] = {
          diagnostics = {
            enable = true;
          }
        }
      }

    })
    require('lspconfig').tsserver.setup({})

    ---
    -- Autocompletion setup
    ---
    local cmp = require('cmp')

    cmp.setup({
      sources = {
        {name = 'nvim_lsp'},
      },
      snippet = {
        expand = function(args)
          -- You need Neovim v0.10 to use vim.snippet
          vim.snippet.expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
    })

  end },
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
}
