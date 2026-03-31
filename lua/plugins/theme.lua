return {
  "0xstepit/flow.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    theme = { transparent = true },
    colors = { fluo = "cyan" },
    ui = {
      borders = "none",
      aggressive_spell = false,
    },
  },
  config = function(_, opts)
    require("flow").setup(opts)
    vim.cmd("colorscheme flow")

    -- editor
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

    -- regular floating windows like diagnostics / hover
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#18181b" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#18181b", fg = "#27272a" })

    -- float titles / labels
    vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatFooter", { bg = "none" })

    -- mini.files specific
    vim.api.nvim_set_hl(0, "MiniFilesNormal", { bg = "#000000" }) -- or "none"
    vim.api.nvim_set_hl(0, "MiniFilesBorder", { bg = "#000000", fg = "#27272a" })
    vim.api.nvim_set_hl(0, "MiniFilesTitle", { bg = "none" })
    vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", { bg = "none" })
  end,
}
