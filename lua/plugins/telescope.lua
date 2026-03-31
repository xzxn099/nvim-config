return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "echasnovski/mini.files",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local mini_files = require("mini.files")

    local function open_minifiles(prompt_bufnr)
      local entry = action_state.get_selected_entry()
      local path = entry.path or entry.filename or entry[1]
      actions.close(prompt_bufnr)

      mini_files.open(path, false)

      vim.schedule(function()
        mini_files.reveal_cwd()
      end)
    end

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<M-CR>"] = open_minifiles,
          },
          n = {
            ["<M-CR>"] = open_minifiles,
          },
        },
      },
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
  end,
}
