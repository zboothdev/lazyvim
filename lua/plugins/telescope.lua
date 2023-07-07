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
      { "<leader>fg", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
      -- replace LazyVim "files" with telescope's builtin "find_files".
      -- Invert mapping so lowercase is cwd
      { "<leader><space>", Util.telescope("find_files"), desc = "Find Files (root dir)" },
      { "<leader>fF", Util.telescope("find_files"), desc = "Find Files (root dir)" },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({ cwd = false, default_text = vim.fn.expand("<cfile>") })
        end,
        desc = "Find Files (cwd)",
      },
      -- Add Ctrl-P mapping.
      { "<C-p>", Util.telescope("find_files", { cwd = false }), desc = "Find Files (cwd)" },
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
