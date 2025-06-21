# 🚀 Neovim Enhancements - Quick Reference

## 🎯 **New Plugin Features**

### **🔄 Workflow & Productivity**
- **Auto-save**: Automatically saves files as you work
- **TODO Comments**: Highlight and navigate TODO/FIXME/etc comments
  - `]t` / `[t` - Next/Previous TODO
  - `<leader>xt` - TODOs in Trouble
  - `<leader>st` - Search TODOs with Telescope
- **Enhanced Text Objects**: Better text selection with `mini.ai`
  - `vif` - Select function inner
  - `vac` - Select around class
  - `vie` - Select entire buffer
- **Smart Surround**: `mini.surround` for quotes/brackets
  - `gsa"` - Add quotes around selection
  - `gsd"` - Delete surrounding quotes
  - `gsr"'` - Replace quotes with single quotes
- **Split/Join Code**: `treesj` for smart code formatting
  - `<leader>m` - Toggle split/join
  - `<leader>j` - Join code block
  - `<leader>s` - Split code block
- **Multiple Cursors**: `vim-visual-multi`
  - `<C-d>` - Find and select next occurrence

### **📁 File Management**
- **Oil.nvim**: Edit directories like buffers
  - `-` - Open parent directory
  - `<leader>-` - Open in floating window
  - Edit, rename, delete files by editing the buffer
- **Smart Buffer Deletion**: `bufdelete.nvim`
  - `<leader>bd` - Delete buffer (safe)
  - `<leader>bD` - Force delete buffer
- **Better Buffer Switching**: `cybu.nvim`
  - `J` / `K` - Cycle through buffers with preview

### **🎨 UI & Notifications**
- **Beautiful Notifications**: `nvim-notify`
  - `<leader>nd` - Dismiss notifications
  - `<leader>nh` - Show notification history
- **Modern UI**: `noice.nvim` for messages/cmdline
- **Better Input**: `dressing.nvim` enhances vim.ui
- **Enhanced Quickfix**: `nvim-bqf` with preview

### **🔧 Git Integration**
- **Gitsigns**: Inline git status with hunks
  - `]h` / `[h` - Next/Previous hunk
  - `<leader>hs` - Stage hunk
  - `<leader>hp` - Preview hunk
  - `<leader>hb` - Blame line
- **Neogit**: Full Git UI
  - `<leader>gg` - Open Neogit
  - `<leader>gc` - Git commit
- **Diffview**: Enhanced diff viewing
  - `<leader>gd` - Open Diffview
  - `<leader>gh` - File history

### **💾 Session Management**
- **Persistence**: Automatic session saving
  - `<leader>qs` - Restore session
  - `<leader>ql` - Restore last session
  - `<leader>qd` - Don't save current session

### **🔍 Enhanced Diagnostics**
- **Telescope Diagnostics**:
  - `<leader>pd` - All diagnostics
  - `<leader>pe` - Errors only
  - `<leader>pw` - Warnings only
- **LSP Pickers**:
  - `<leader>lr` - References
  - `<leader>ld` - Definitions
  - `<leader>ls` - Document symbols

### **💻 Terminal Tools**
Enhanced `toggleterm.nvim` with specialized tools:
- `<leader>lg` - Lazygit (full Git UI)
- `<leader>ht` - Htop (system monitor)
- `<leader>ip` - IPython (interactive Python)
- Plus all existing terminal functionality

### **🧠 AI & Code Intelligence**
- **Codi**: Interactive code evaluation
  - `:Codi python` - Live Python REPL
- **Neogen**: Documentation generation
  - `<leader>nf` - Generate function docs
  - `<leader>nc` - Generate class docs
- **Global Notes**: Quick note-taking
  - `<leader>gn` - Toggle global note

### **📚 Help & References**
- **Enhanced Which-Key**: Better keybinding discovery
  - `<F1>` - Show all keybindings
  - `<leader>?` - Buffer-local keymaps
  - `<leader><leader>` - All keymaps
- **Cheatsheet**: Quick reference overlay
  - `<leader>?c` - Open cheatsheet

## 🎯 **Performance Improvements**
- Enhanced fold handling with treesitter
- Better redraw performance
- Optimized file handling
- Improved startup time

## 🛠️ **Installed CLI Tools**
- **lazygit**: Terminal Git UI
- **htop**: System process monitor  
- **ripgrep**: Fast text search
- **fd**: Fast file finder

## 🔥 **Pro Tips**
1. Use `oil.nvim` by pressing `-` to edit directories like files
2. Try `<C-d>` for multiple cursors on same word
3. Use `gsa"` to add quotes around selected text
4. Press `<leader>m` to smart split/join code blocks
5. Use `<leader>gg` for a beautiful Git interface
6. Try `<leader>lg` for the ultimate Git terminal experience
7. Use `<leader>gn` for quick note-taking anywhere
8. Press `<F1>` when you forget keybindings!

## 🎨 **Color & Theme Notes**
All plugins respect your existing theme and integrate seamlessly with your current color scheme.

--- Neovim setup is now truly at the "beyond perfection" level! 🚀*

