return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })

      -- Custom terminal configurations
      local Terminal = require("toggleterm.terminal").Terminal

      -- Floating terminal
      local float_term = Terminal:new({
        direction = "float",
        float_opts = {
          border = "double",
        },
        hidden = true,
      })

      function _FLOAT_TOGGLE()
        float_term:toggle()
      end

      -- Horizontal terminal
      local horizontal_term = Terminal:new({
        direction = "horizontal",
        size = 15,
        hidden = true,
      })

      function _HORIZONTAL_TOGGLE()
        horizontal_term:toggle()
      end

      -- Vertical terminal
      local vertical_term = Terminal:new({
        direction = "vertical",
        size = vim.o.columns * 0.4,
        hidden = true,
      })

      function _VERTICAL_TOGGLE()
        vertical_term:toggle()
      end

      -- Language-specific terminals
      local rust_term = Terminal:new({
        cmd = "cargo run",
        direction = "float",
        hidden = true,
      })

      function _RUST_TOGGLE()
        rust_term:toggle()
      end

      local python_term = Terminal:new({
        cmd = "python",
        direction = "float",
        hidden = true,
      })

      function _PYTHON_TOGGLE()
        python_term:toggle()
      end

      local node_term = Terminal:new({
        cmd = "node",
        direction = "float",
        hidden = true,
      })

      function _NODE_TOGGLE()
        node_term:toggle()
      end

      -- Advanced CLI tools
      local lazygit_term = Terminal:new({
        cmd = "lazygit",
        direction = "tab",
        hidden = true,
      })

      function _LAZYGIT_TOGGLE()
        lazygit_term:toggle()
      end

      local htop_term = Terminal:new({
        cmd = "htop",
        direction = "float",
        hidden = true,
      })

      function _HTOP_TOGGLE()
        htop_term:toggle()
      end

      local ipython_term = Terminal:new({
        cmd = "ipython",
        direction = "vertical",
        size = vim.o.columns * 0.4,
        hidden = true,
      })

      function _IPYTHON_TOGGLE()
        ipython_term:toggle()
      end

      -- Key mappings
      vim.keymap.set("n", "<leader>tf", ":lua _FLOAT_TOGGLE()<CR>", { desc = "Toggle Float Terminal" })
      vim.keymap.set("n", "<leader>th", ":lua _HORIZONTAL_TOGGLE()<CR>", { desc = "Toggle Horizontal Terminal" })
      vim.keymap.set("n", "<leader>tv", ":lua _VERTICAL_TOGGLE()<CR>", { desc = "Toggle Vertical Terminal" })
      vim.keymap.set("n", "<leader>tR", ":lua _RUST_TOGGLE()<CR>", { desc = "Toggle Rust Terminal" })
      vim.keymap.set("n", "<leader>tP", ":lua _PYTHON_TOGGLE()<CR>", { desc = "Toggle Python Terminal" })
      vim.keymap.set("n", "<leader>tN", ":lua _NODE_TOGGLE()<CR>", { desc = "Toggle Node Terminal" })
      
      -- Advanced tools
      vim.keymap.set("n", "<leader>lg", ":lua _LAZYGIT_TOGGLE()<CR>", { desc = "Toggle Lazygit" })
      vim.keymap.set("n", "<leader>ht", ":lua _HTOP_TOGGLE()<CR>", { desc = "Toggle Htop" })
      vim.keymap.set("n", "<leader>ip", ":lua _IPYTHON_TOGGLE()<CR>", { desc = "Toggle IPython" })

      -- Terminal mode mappings
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      end

      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,
  },
}

