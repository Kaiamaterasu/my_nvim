-- Auto commands for better performance and productivity
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- General settings
local general = augroup("General", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
  group = general,
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- Auto save when focus is lost
autocmd("FocusLost", {
  group = general,
  command = "silent! wa",
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  group = general,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Auto-resize splits when Vim is resized
autocmd("VimResized", {
  group = general,
  command = "tabdo wincmd =",
})

-- Close certain filetypes with q
autocmd("FileType", {
  group = general,
  pattern = {
    "qf",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Better buffer management
local buffers = augroup("Buffers", { clear = true })

-- Don't auto-wrap comments
autocmd("BufWinEnter", {
  group = buffers,
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Auto-create directories when saving
autocmd("BufWritePre", {
  group = buffers,
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Performance optimizations
local performance = augroup("Performance", { clear = true })

-- Disable unnecessary plugins for large files
autocmd("BufReadPre", {
  group = performance,
  callback = function()
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
    if ok and stats and stats.size > 1024 * 1024 then -- 1MB
      vim.opt_local.foldmethod = "manual"
      vim.opt_local.spell = false
      vim.opt_local.swapfile = false
      vim.opt_local.undofile = false
      vim.opt_local.breakindent = false
      vim.opt_local.colorcolumn = ""
      vim.opt_local.statuscolumn = ""
      vim.opt_local.signcolumn = "no"
      vim.opt_local.foldcolumn = "0"
      vim.opt_local.winbar = ""
      vim.b.minianimate_disable = true
    end
  end,
})

-- LSP optimizations
local lsp = augroup("LspAttach", { clear = true })

-- Show line diagnostics automatically in hover window
autocmd("CursorHold", {
  group = lsp,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always",
      prefix = " ",
      scope = "cursor",
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})

-- File-specific optimizations
local filetypes = augroup("FileTypes", { clear = true })

-- Faster keywordprg for lua files
autocmd("FileType", {
  group = filetypes,
  pattern = "lua",
  callback = function()
    vim.bo.keywordprg = ":help"
  end,
})

-- Better editing for certain filetypes
autocmd("FileType", {
  group = filetypes,
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Terminal settings
autocmd("TermOpen", {
  group = general,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0
    vim.cmd("startinsert")
  end,
})

