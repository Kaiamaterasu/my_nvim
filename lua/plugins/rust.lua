return {
  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
    ft = "rust",
    config = function()
      local rt = require("rust-tools")
      
      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
        dap = {
          adapter = {
            type = "executable",
            command = "codelldb",
            name = "rt_lldb",
          },
        },
      })
    end,
  },
  {
    "Saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function()
      require("crates").setup()
    end,
  },
}

