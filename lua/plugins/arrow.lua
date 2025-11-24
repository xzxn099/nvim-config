return {
  "otavioschwanck/arrow.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "echasnovski/mini.files",
  },
  opts = {
    show_icons = true,
    leader_key = ";",
    buffer_leader_key = "m",
  },
  config = function(_, opts)
    local arrow = require("arrow")
    local persist = require("arrow.persist")
    local mini_files = require("mini.files")

    arrow.setup(opts)

    local function close_arrow_ui()
      -- toggles Arrow menu; when menu is open this closes it
      require("arrow.persist").toggle()
    end

    local function try_get_bookmark(index)
      if type(persist.get_bookmarks) == "function" then
        local ok, bookmarks = pcall(persist.get_bookmarks)
        if ok and type(bookmarks) == "table" then
          return bookmarks[index]
        end
      end
      return nil
    end

    local function open_arrow_in_minifiles(index)
      local path = try_get_bookmark(index)

      if not path or path == "" then
        close_arrow_ui()
        pcall(persist.go_to, index)
        path = vim.api.nvim_buf_get_name(0)
        if not path or path == "" then return end
      else
        close_arrow_ui()
      end

      -- Open at the bookmark (this becomes "latest explorer")
      mini_files.open(path, false)

      -- IMPORTANT: reset explorer state to this new anchor
      -- so reopening latest starts here, not from older nav state
      vim.schedule(function()
        mini_files.reset()       -- sets latest state to anchor
        mini_files.reveal_cwd()  -- show chain from CWD if possible
      end)
    end

    for i = 1, 9 do
      vim.keymap.set("n", ("<M-%d>"):format(i), function()
        open_arrow_in_minifiles(i)
      end, { desc = ("Arrow %d → mini.files"):format(i) })
    end
  end,
}

