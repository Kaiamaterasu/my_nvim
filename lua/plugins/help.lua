return {
  -- Enhanced which-key with more context
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        preset = "modern",
        delay = 300,
        filter = function(mapping)
          return true
        end,
        spec = {},
        notify = true,
        triggers = {
          { "<auto>", mode = "nixsotc" },
          { "s", mode = { "n", "v" } },
        },
        defer = function(ctx)
          return ctx.mode == "V" or ctx.mode == "<C-V>"
        end,
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = true,
            suggestions = 20,
          },
          presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
          },
        },
        win = {
          no_overlap = true,
          padding = { 1, 2 },
          title = true,
          title_pos = "center",
          zindex = 1000,
          bo = {},
          wo = {
            winblend = 10,
          },
        },
        layout = {
          width = { min = 20 },
          spacing = 3,
        },
        keys = {
          scroll_down = "<c-d>",
          scroll_up = "<c-u>",
        },
        sort = { "local", "order", "group", "alphanum", "mod" },
        expand = 0,
        replace = {
          ["<space>"] = "SPC",
          ["<cr>"] = "RET",
          ["<tab>"] = "TAB",
        },
        icons = {
          breadcrumb = "»",
          separator = "➜",
          group = "+",
          ellipsis = "…",
          mappings = true,
          rules = {},
          colors = true,
          keys = {
            Up = " ",
            Down = " ",
            Left = " ",
            Right = " ",
            C = "󰘴 ",
            M = "󰘵 ",
            D = "󰘳 ",
            S = "󰘶 ",
            CR = "󰌑 ",
            Esc = "󱊷 ",
            ScrollWheelDown = "󱕐 ",
            ScrollWheelUp = "󱕑 ",
            NL = "󰌑 ",
            BS = "󰁮",
            Space = "󱁐 ",
            Tab = "󰌒 ",
            F1 = "󱊫",
            F2 = "󱊬",
            F3 = "󱊭",
            F4 = "󱊮",
            F5 = "󱊯",
            F6 = "󱊰",
            F7 = "󱊱",
            F8 = "󱊲",
            F9 = "󱊳",
            F10 = "󱊴",
            F11 = "󱊵",
            F12 = "󱊶",
          },
        },
        show_help = true,
        show_keys = true,
        disable = {
          buftypes = {},
          filetypes = {},
        },
      })

      -- Register key groups
      wk.add({
        { "<leader>b", group = "Buffers" },
        { "<leader>c", group = "Code" },
        { "<leader>d", group = "Debug" },
        { "<leader>f", group = "File/Find" },
        { "<leader>g", group = "Git" },
        { "<leader>h", group = "Git Hunks" },
        { "<leader>l", group = "LSP" },
        { "<leader>n", group = "Notes/Docs" },
        { "<leader>p", group = "Project/Search" },
        { "<leader>q", group = "Session" },
        { "<leader>s", group = "Search" },
        { "<leader>t", group = "Terminal" },
        { "<leader>u", group = "UI" },
        { "<leader>w", group = "Windows" },
        { "<leader>x", group = "Diagnostics/Quickfix" },
        
        -- Custom help binding
        { "<leader>?", function() 
          wk.show({ global = false })
        end, desc = "Buffer Local Keymaps" },
        
        { "<leader><leader>", function()
          wk.show({ global = true })
        end, desc = "All Keymaps" },
      })

      -- Custom keymap for showing all keybindings
      vim.keymap.set("n", "<F1>", function()
        wk.show({ global = true })
      end, { desc = "Show All Keybindings" })
    end,
  },

  -- Quick reference overlay
  {
    "sudormrfbin/cheatsheet.nvim",
    cmd = { "Cheatsheet", "CheatsheetEdit" },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("cheatsheet").setup({
        bundled_cheatsheets = {
          enabled = { "default", "lua", "markdown", "regex", "netrw", "unicode" },
          disabled = { "nerd-fonts" },
        },
        bundled_plugin_cheatsheets = {
          enabled = {
            "auto-session",
            "goto-preview",
            "octo.nvim",
            "telescope.nvim",
            "vim-easy-align",
            "vim-sandwich",
          },
          disabled = { "gitsigns" },
        },
        include_only_installed_plugins = true,
        telescope_mappings = {
          ["<CR>"] = require("cheatsheet.telescope.actions").select_or_fill_commandline,
          ["<A-CR>"] = require("cheatsheet.telescope.actions").select_or_execute,
          ["<C-Y>"] = require("cheatsheet.telescope.actions").copy_cheat_value,
          ["<C-E>"] = require("cheatsheet.telescope.actions").edit_user_cheatsheet,
        },
      })

      vim.keymap.set("n", "<leader>?c", "<cmd>Cheatsheet<cr>", { desc = "Open cheatsheet" })
    end,
  },
}

