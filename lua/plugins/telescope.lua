return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "truncate" },
          file_ignore_patterns = { 
            ".git/", "node_modules/", "__pycache__/", "*.pyc",
            "target/", "build/", "dist/", "*.o", "*.a", "*.so",
            "*.class", "*.jar", "*.exe", "*.dll", "*.tmp", "*.swp",
            "*.DS_Store", "Thumbs.db", "*.min.js", "*.min.css"
          },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob=!.git/",
          },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
            n = {
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          live_grep = {
            additional_args = function(opts)
              return {"--hidden"}
            end
          },
        },
      })

      telescope.load_extension("fzf")
      
      -- Load notify extension if available
      pcall(function() telescope.load_extension("notify") end)

      -- Keymaps
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git Files" })
      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end, { desc = "Grep String" })
      vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "Help Tags" })
      vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>pr", builtin.oldfiles, { desc = "Recent Files" })
      
      -- Diagnostics pickers
      vim.keymap.set("n", "<leader>pd", builtin.diagnostics, { desc = "Diagnostics" })
      vim.keymap.set("n", "<leader>pe", function()
        builtin.diagnostics({ severity = vim.diagnostic.severity.ERROR })
      end, { desc = "Errors" })
      vim.keymap.set("n", "<leader>pw", function()
        builtin.diagnostics({ severity = vim.diagnostic.severity.WARN })
      end, { desc = "Warnings" })
      
      -- LSP pickers
      vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "LSP References" })
      vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, { desc = "LSP Definitions" })
      vim.keymap.set("n", "<leader>li", builtin.lsp_implementations, { desc = "LSP Implementations" })
      vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "Document Symbols" })
      vim.keymap.set("n", "<leader>lS", builtin.lsp_workspace_symbols, { desc = "Workspace Symbols" })
    end,
  },
}

