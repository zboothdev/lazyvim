local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
      { "<leader>fg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
    },
    opts = {
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          width = 0.99,
          height = 0.99,
        },
        sorting_strategy = "ascending",
        winblend = 0,
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-ignore-vcs",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
      },
      pickers = {
        find_files = {
          find_command = {
            "rg",
            "--color=never",
            "--no-ignore-vcs",
            "--files",
          },
        },
      },
    },
  },
}
