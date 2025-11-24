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
    local ui = require("arrow.ui")
    local mini_files = require("mini.files")

    arrow.setup(opts)

    -- Close Arrow UI (supports both old/new)
    local function close_arrow_ui()
      if type(ui.close) == "function" then
        pcall(ui.close)
      elseif type(ui.toggle) == "function" then
        pcall(ui.toggle)
      end
    end

    -- Try to get the path directly if API is available
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
      -- 1) find path
      local path = try_get_bookmark(index)

      -- If direct API not available, fallback:
      if not path or path == "" then
        -- 2) close arrow window FIRST so go_to opens in normal window
        close_arrow_ui()

        -- Open file normally to discover its path
        pcall(persist.go_to, index)
        path = vim.api.nvim_buf_get_name(0)
        if not path or path == "" then return end
      else
        -- 2) close arrow window
        close_arrow_ui()
      end

      -- 3) open path in minifiles + show cwd chain
      mini_files.open(path, false)
      vim.schedule(function()
        mini_files.reveal_cwd()
      end)
    end

    -- Alt+1..Alt+9 => slots 1..9
    for i = 1, 9 do
      vim.keymap.set("n", ("<M-%d>"):format(i), function()
        open_arrow_in_minifiles(i)
      end, { desc = ("Arrow %d → mini.files"):format(i) })
    end

    -- Alt+a..Alt+z => slots 10..35
    local letters = "abcdefghijklmnopqrstuvwxyz"
    for j = 1, #letters do
      local ch = letters:sub(j, j)
      local idx = 9 + j
      vim.keymap.set("n", "<M-" .. ch .. ">", function()
        open_arrow_in_minifiles(idx)
      end, { desc = ("Arrow %d → mini.files"):format(idx) })
    end
  end,
}

