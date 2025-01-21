return {
	"0xstepit/flow.nvim",
	lazy = false,
	priority = 1000,
	opts = {
    theme = {
      style = "dark", 
      transparent = true, 
    },
    colors = {
      mode = "dark", 
      fluo = "cyan", 
      custom = {
        saturation = "70", 
        light = "65", 
      },
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

