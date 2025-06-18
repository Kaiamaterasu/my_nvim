-- Additional keymaps
local keymap = vim.keymap

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Clear highlights
keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear highlights" })

-- Stay in indent mode
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Keep last yanked when pasting
keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Better escape
keymap.set("i", "jk", "<ESC>", { desc = "Escape insert mode" })
keymap.set("i", "jj", "<ESC>", { desc = "Escape insert mode (alternative)" })

-- Move text up and down
keymap.set("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move text down" })
keymap.set("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move text up" })
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = "Move text down" })
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = "Move text up" })

-- Better up/down
keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Save and quit shortcuts
keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
keymap.set("n", "<leader>x", "<cmd>x<cr>", { desc = "Save and quit" })

-- Buffer management
keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
keymap.set("n", "<leader>bD", "<cmd>bdelete!<cr>", { desc = "Force delete buffer" })
keymap.set("n", "<leader>ba", "<cmd>%bdelete|edit#|bdelete#<cr>", { desc = "Delete all buffers except current" })

-- Quick fix and location list
keymap.set("n", "<leader>co", "<cmd>copen<cr>", { desc = "Open quickfix" })
keymap.set("n", "<leader>cc", "<cmd>cclose<cr>", { desc = "Close quickfix" })
keymap.set("n", "[q", "<cmd>cprev<cr>", { desc = "Previous quickfix" })
keymap.set("n", "]q", "<cmd>cnext<cr>", { desc = "Next quickfix" })

-- Better search and replace
keymap.set("n", "<leader>sr", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", { desc = "Search and replace word under cursor" })
keymap.set("v", "<leader>sr", ":s///g<Left><Left><Left>", { desc = "Search and replace in selection" })

-- Toggle options
keymap.set("n", "<leader>tw", "<cmd>set wrap!<cr>", { desc = "Toggle word wrap" })
keymap.set("n", "<leader>ts", "<cmd>set spell!<cr>", { desc = "Toggle spell check" })
keymap.set("n", "<leader>tn", "<cmd>set number!<cr>", { desc = "Toggle line numbers" })
keymap.set("n", "<leader>tr", "<cmd>set relativenumber!<cr>", { desc = "Toggle relative numbers" })

