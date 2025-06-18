return {
  -- Interactive code evaluation
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
    config = function()
      vim.g.codi_interpreters = {
        python = {
          bin = "python",
          prompt = "^(>>>|\\.\\.\\.) ",
        },
        javascript = {
          bin = "node",
        },
        rust = {
          bin = "evcxr",
        },
        lua = {
          bin = "lua",
        },
      }
    end,
  },

  -- Enhanced documentation generation
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("neogen").setup({
        enabled = true,
        input_after_comment = true,
        snippet_engine = "luasnip",
        languages = {
          lua = {
            template = {
              annotation_convention = "ldoc",
            },
          },
          python = {
            template = {
              annotation_convention = "google_docstrings",
            },
          },
          rust = {
            template = {
              annotation_convention = "rustdoc",
            },
          },
          javascript = {
            template = {
              annotation_convention = "jsdoc",
            },
          },
          typescript = {
            template = {
              annotation_convention = "tsdoc",
            },
          },
        },
      })

      vim.keymap.set("n", "<leader>nf", ":lua require('neogen').generate()<CR>", { desc = "Generate function docs" })
      vim.keymap.set("n", "<leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", { desc = "Generate class docs" })
      vim.keymap.set("n", "<leader>nt", ":lua require('neogen').generate({ type = 'type' })<CR>", { desc = "Generate type docs" })
      vim.keymap.set("n", "<leader>nF", ":lua require('neogen').generate({ type = 'file' })<CR>", { desc = "Generate file docs" })
    end,
  },

  -- Global note taking
  {
    "backdround/global-note.nvim",
    config = function()
      local global_note = require("global-note")
      global_note.setup({
        filename = "global.md",
        directory = vim.fn.expand("~/notes/"),
        title = "Global Note",
        command_name = "GlobalNote",
        window_config = function()
          local window_height = vim.api.nvim_list_uis()[1].height
          local window_width = vim.api.nvim_list_uis()[1].width
          return {
            relative = "editor",
            border = "rounded",
            title = "Global Note",
            title_pos = "center",
            width = math.floor(0.7 * window_width),
            height = math.floor(0.85 * window_height),
            row = math.floor(0.05 * window_height),
            col = math.floor(0.15 * window_width),
          }
        end,
        post_open = function(buffer_id, window_id)
          vim.api.nvim_buf_set_option(buffer_id, "filetype", "markdown")
        end,
      })

      vim.keymap.set("n", "<leader>gn", global_note.toggle_note, {
        desc = "Toggle global note",
      })
    end,
  },

  -- Enhanced syntax highlighting for various formats
  {
    "fladson/vim-kitty",
    ft = "kitty",
  },
  {
    "chrisbra/csv.vim",
    ft = "csv",
  },
  {
    "elzr/vim-json",
    ft = "json",
    config = function()
      vim.g.vim_json_syntax_conceal = 0
    end,
  },
}

