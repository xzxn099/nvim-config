return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
      },
      indent = {
        enable = true,
        style = {
         "#171d24" -- "#14191f",
        },
      },
      line_num = {
        enable = true,
      },
      blank = {
        enable = true,
      }
    })
  end
}

