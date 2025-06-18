return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    config = function()
      local wk = require("which-key")
      wk.setup()

      -- Register key mappings
      wk.add({
        { "<leader>f", group = "File" },
        { "<leader>p", group = "Project/Find" },
        { "<leader>g", group = "Git" },
        { "<leader>d", group = "Debug" },
        { "<leader>t", group = "Terminal" },
        { "<leader>v", group = "LSP" },
        { "<leader>w", group = "Window" },
        { "<leader>b", group = "Buffer" },
      })
    end,
  },
}

