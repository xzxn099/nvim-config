return {
	"0xstepit/flow.nvim",
	lazy = false,
	priority = 1000,
	opts = {
    theme = {
      transparent = true, 
    },
    colors = {
      fluo = "cyan", 
    },
    ui = {
      borders = "theme", -- "theme" | "inverse" | "fluo" | "none"
      aggressive_spell = false, -- true | false
    },
  },
  config = function(_, opts)
    require("flow").setup(opts)
    vim.cmd("colorscheme flow")
  end,
}

