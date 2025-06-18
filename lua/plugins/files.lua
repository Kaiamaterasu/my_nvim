return {
  -- Modern file explorer that edits like a buffer
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        columns = {
          "icon",
          "permissions",
          "size",
          "mtime",
        },
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = false,
        prompt_save_on_select_new_entry = true,
        cleanup_delay_ms = 2000,
        lsp_file_methods = {
          timeout_ms = 1000,
          autosave_changes = false,
        },
        constrain_cursor = "editable",
        experimental_watch_for_changes = false,
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        use_default_keymaps = true,
        view_options = {
          show_hidden = false,
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
          is_always_hidden = function(name, bufnr)
            return false
          end,
          sort = {
            { "type", "asc" },
            { "name", "asc" },
          },
        },
        float = {
          padding = 2,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          override = function(conf)
            return conf
          end,
        },
        preview = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = 0.9,
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          update_on_cursor_moved = true,
        },
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          minimized_border = "none",
          win_options = {
            winblend = 0,
          },
        },
      })

      -- Keymaps
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      vim.keymap.set("n", "<leader>-", "<CMD>Oil --float<CR>", { desc = "Open parent directory in float" })
    end,
  },

  -- Smart buffer deletion
  {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete", "Bwipeout" },
    keys = {
      { "<leader>bd", "<cmd>Bdelete<cr>", desc = "Delete buffer" },
      { "<leader>bD", "<cmd>Bdelete!<cr>", desc = "Delete buffer (force)" },
      { "<leader>bw", "<cmd>Bwipeout<cr>", desc = "Wipeout buffer" },
    },
  },

  -- Better buffer switching
  {
    "ghillb/cybu.nvim",
    branch = "main",
    requires = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
    config = function()
      local ok, cybu = pcall(require, "cybu")
      if not ok then
        return
      end
      cybu.setup({
        position = {
          relative_to = "win",
          anchor = "topleft",
          vertical_offset = 10,
          horizontal_offset = 0,
          max_win_height = 5,
          max_win_width = 0.5,
        },
        style = {
          path = "relative",
          path_abbreviation = "none",
          border = "rounded",
          separator = " ",
          prefix = "…",
          padding = 1,
          hide_buffer_id = true,
          devicons = {
            enabled = true,
            colored = true,
            truncate = true,
          },
          highlights = {
            current_buffer = "CybuFocus",
            adjacent_buffers = "CybuAdjacent",
            background = "CybuBackground",
            border = "CybuBorder",
          },
        },
        behavior = {
          mode = {
            default = {
              switch = "immediate",
              view = "paging",
            },
            last_used = {
              switch = "on_close",
              view = "rolling",
            },
            auto = {
              view = "rolling",
            },
          },
        },
        display_time = 1750,
        exclude = {
          "qf",
          "help",
          "man",
          "fugitive",
          "oil",
        },
        fallback = function() end,
      })

      vim.keymap.set("n", "K", "<Plug>(CybuPrev)")
      vim.keymap.set("n", "J", "<Plug>(CybuNext)")
    end,
  },
}

