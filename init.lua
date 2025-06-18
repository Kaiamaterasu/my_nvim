-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 250  -- More reasonable update time
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- Performance optimizations
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 240
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 0
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000
vim.opt.regexpengine = 1

-- Advanced performance settings
vim.opt.ttyfast = true
vim.opt.updatetime = 250
vim.opt.redrawtime = 1500
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.fillchars = {
  foldopen = "▾",
  foldclose = "▸",
  fold = " ",
  foldsep = " ",
  diff = "/",
  eob = " ",
}

-- Better completion
vim.opt.completeopt = "menuone,noselect"
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0

-- Better split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Ensure undodir exists
vim.fn.mkdir(vim.fn.expand("~/.vim/undodir"), "p")

-- Load plugins
require("lazy").setup("plugins")

-- Load keymaps
require("keymaps")

-- Load autocmds
require("autocmds")

