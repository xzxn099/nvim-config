return {
    "0xstepit/flow.nvim",
    lazy = false,
    priority = 1000,
    opts = {theme = {transparent = true}, colors = {fluo = "cyan"}, ui = {borders = "none", aggressive_spell = false}},
    config = function(_, opts)
        require("flow").setup(opts)
        vim.cmd("colorscheme flow")
        vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
        vim.api.nvim_set_hl(0, "NormalNC", {bg = "none"})
        vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
        vim.api.nvim_set_hl(0, "FloatBorder", {bg = "none", fg = "#27272a"})
    end
}

