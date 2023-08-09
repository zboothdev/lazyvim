local Util = require("lazyvim.util")

local defaults = {
  find_files_command = {
    "rg",
    "--color=never",
    "--no-ignore-vcs",
    "--files",
  },
  vimgrep_arguments_command = {
    "rg",
    "--color=never",
    "--no-ignore-vcs",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
    "--smart-case",
  },
}

-- Neoconf integration
require("neoconf.plugins").register({
  name = "telescope",
  on_schema = function(schema)
    -- this call will create a json schema based on the lua types of your default settings
    schema:import("telescope", defaults)
  end,
})

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
    dependencies = {
      { "nvim-lspconfig" }, -- HACK: the spec for nvim-lspconfig manually performs the neoconf setup()
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
      },
    },
    config = function(_, opts)
      -- Note: opts should be the merged table from all plugin specs.
      local conf = require("neoconf").get("telescope", defaults)

      -- Set find commands based on defaults.
      opts.defaults.vimgrep_arguments = conf.vimgrep_arguments_command
      opts.pickers = {
        find_files = {
          find_command = conf.find_files_command,
        },
      }
      -- Need to pass modified opts to actual plugin.
      require("telescope").setup(opts)
    end,
  },
}
