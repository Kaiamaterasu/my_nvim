return {
  -- Git signs in the gutter
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = '▎' },
          change       = { text = '▎' },
          delete       = { text = '' },
          topdelete    = { text = '' },
          changedelete = { text = '▎' },
          untracked    = { text = '▎' },
        },
        signs_staged = {
          add          = { text = '▎' },
          change       = { text = '▎' },
          delete       = { text = '' },
          topdelete    = { text = '' },
          changedelete = { text = '▎' },
        },
        on_attach = function(buffer)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
          end

          -- Navigation
          map("n", "]h", gs.next_hunk, "Next Hunk")
          map("n", "[h", gs.prev_hunk, "Prev Hunk")

          -- Actions
          map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
          map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
          map("v", "<leader>hs", function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, "Stage hunk")
          map("v", "<leader>hr", function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, "Reset hunk")

          map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
          map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

          map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
          map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

          map("n", "<leader>hb", function() gs.blame_line{full=true} end, "Blame line")
          map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

          map("n", "<leader>hd", gs.diffthis, "Diff this")
          map("n", "<leader>hD", function() gs.diffthis('~') end, "Diff this ~")

          -- Text object
          map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
        end,
        preview_config = {
          border = 'rounded',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 300,
        },
        diff_opts = {
          internal = true,
        },
      })
    end,
  },

  -- Full-featured Git UI
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup({
        integrations = {
          telescope = true,
          diffview = true,
        },
        graph_style = "ascii",
        git_services = {
          ["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
          ["bitbucket.org"] = "https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1",
          ["gitlab.com"] = "https://gitlab.com/${owner}/${repository}/-/merge_requests/new?merge_request[source_branch]=${branch_name}",
        },
        telescope_sorter = function()
          return require("telescope").extensions.fzf.native_fzf_sorter()
        end,
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit" })
      vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit<cr>", { desc = "Git commit" })
      vim.keymap.set("n", "<leader>gp", "<cmd>Neogit pull<cr>", { desc = "Git pull" })
      vim.keymap.set("n", "<leader>gP", "<cmd>Neogit push<cr>", { desc = "Git push" })
    end,
  },

  -- Enhanced diff viewing
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
        view = {
          default = {
            layout = "diff2_horizontal",
          },
          merge_tool = {
            layout = "diff3_horizontal",
            disable_diagnostics = true,
          },
        },
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
      vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>", { desc = "File History" })
      vim.keymap.set("n", "<leader>gq", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })
    end,
  },
}

