return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")
      
      conform.setup({
        formatters_by_ft = {
          -- Lua
          lua = { "stylua" },
          
          -- Python
          python = { "isort", "black" },
          
          -- Rust
          rust = { "rustfmt" },
          
          -- JavaScript/TypeScript
          javascript = { { "prettierd", "prettier" } },
          typescript = { { "prettierd", "prettier" } },
          javascriptreact = { { "prettierd", "prettier" } },
          typescriptreact = { { "prettierd", "prettier" } },
          
          -- Web technologies
          html = { { "prettierd", "prettier" } },
          css = { { "prettierd", "prettier" } },
          scss = { { "prettierd", "prettier" } },
          json = { { "prettierd", "prettier" } },
          jsonc = { { "prettierd", "prettier" } },
          yaml = { { "prettierd", "prettier" } },
          markdown = { { "prettierd", "prettier" } },
          
          -- C/C++
          c = { "clang-format" },
          cpp = { "clang-format" },
          
          -- Go
          go = { "gofmt" },
          
          -- Shell
          sh = { "shfmt" },
          bash = { "shfmt" },
          zsh = { "shfmt" },
          
          -- Other
          toml = { "taplo" },
          xml = { "xmlformat" },
        },
        
        -- Format on save configuration
        format_on_save = function(bufnr)
          -- Disable for certain file types or large files
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          if bufname:match("/node_modules/") then
            return
          end
          
          -- Check file size (disable for files > 1MB)
          local max_filesize = 1024 * 1024 -- 1 MB
          local ok, stats = pcall(vim.loop.fs_stat, bufname)
          if ok and stats and stats.size > max_filesize then
            return
          end
          
          return {
            timeout_ms = 1000,
            lsp_fallback = true,
          }
        end,
        
        -- Customize formatters
        formatters = {
          shfmt = {
            prepend_args = { "-i", "2" }, -- 2 space indentation
          },
          black = {
            prepend_args = { "--line-length", "88" },
          },
        },
        
        -- Notification on format
        notify_on_error = true,
      })

      -- Enhanced format keymaps
      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 2000,
        })
      end, { desc = "Format file or range" })
      
      -- Toggle format on save
      vim.keymap.set("n", "<leader>uf", function()
        if vim.g.disable_autoformat then
          vim.g.disable_autoformat = false
          print("Enabled format on save")
        else
          vim.g.disable_autoformat = true
          print("Disabled format on save")
        end
      end, { desc = "Toggle format on save" })
      
      -- Info about formatters
      vim.keymap.set("n", "<leader>fi", function()
        print(vim.inspect(conform.list_formatters()))
      end, { desc = "Show formatter info" })
    end,
  },
}

