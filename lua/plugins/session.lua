return {
  -- Automatic session management
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" },
        pre_save = nil,
        save_empty = false,
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore Session" })
      vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Restore Last Session" })
      vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Don't Save Current Session" })
    end,
  },

  -- Alternative: More advanced session management
  {
    "stevearc/resession.nvim",
    enabled = false, -- Enable this if you prefer more control
    config = function()
      local resession = require("resession")
      resession.setup({
        autosave = {
          enabled = true,
          interval = 60,
          notify = false,
        },
        options = {
          "binary",
          "bufhidden",
          "buflisted",
          "buftype",
          "diff",
          "filetype",
          "modifiable",
          "previewwindow",
          "readonly",
          "scrollbind",
          "winfixheight",
          "winfixwidth",
        },
        extensions = {
          overseer = {},
          quickfix = {},
        },
      })

      -- Automatically save sessions
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc(-1) == 0 then
            resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
          end
        end,
      })

      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
        end,
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>ss", resession.save, { desc = "Save session" })
      vim.keymap.set("n", "<leader>sl", resession.load, { desc = "Load session" })
      vim.keymap.set("n", "<leader>sd", resession.delete, { desc = "Delete session" })
    end,
  },
}

