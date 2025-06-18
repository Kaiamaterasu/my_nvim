# 🌟 Neovim Config - Modern, Productive, Modular

Welcome to my custom Neovim configuration!  
This setup is built for speed, power, and modern workflows—perfect for developers who want a clean and efficient coding environment powered by Lua.

---

## 🔧 Features

- **Leader Key:** `<Space>`
- **Auto-save:** On buffer leave, focus lost, and text changes
- **Relative Line Numbers**
- **Clipboard Integration**
- **Persistent Undo History**
- **Fully Modular Lua Setup**

---

## 📁 Plugin Highlights

| Category         | Plugins Used                                                                 |
|------------------|------------------------------------------------------------------------------|
| **File Explorer**| `stevearc/oil.nvim`                                                          |
| **Fuzzy Finder** | `nvim-telescope/telescope.nvim`                                              |
| **Git**          | `lewis6991/gitsigns.nvim`, `NeogitOrg/neogit`, `sindrets/diffview.nvim`     |
| **LSP & IntelliSense** | `neovim/nvim-lspconfig`, `hrsh7th/nvim-cmp`                          |
| **Debugging**    | `mfussenegger/nvim-dap`                                                      |
| **Navigation**   | `ThePrimeagen/harpoon`, `folke/flash.nvim`, `chentoast/marks.nvim`          |
| **Surround**     | `echasnovski/mini.surround`                                                  |
| **Multiple Cursors** | `mg979/vim-visual-multi`                                               |
| **Terminal**     | `akinsho/toggleterm.nvim`                                                    |
| **Commenting**   | `numToStr/Comment.nvim`, `folke/todo-comments.nvim`                          |
| **Keybinding Help** | `folke/which-key.nvim`                                                  |
| **Theme/UI**     | Modern theme, smooth animations, icons, statusline                           |

---

## 🧠 Keybindings Overview

| Action              | Shortcut                      |
|---------------------|-------------------------------|
| Save/Quit           | `<leader>w`, `<leader>q`, `<leader>x` |
| Window Navigation   | `Ctrl+h/j/k/l`                |
| Buffer Switch       | `Shift+l`, `Shift+h`          |
| File Explorer       | `-`, `<leader>-`              |
| Search Files        | `<leader>pf`, `Ctrl+p`        |
| Live Grep           | `<leader>pg`                  |
| Git Interface       | `<leader>gg`, `<leader>gc`, etc. |
| Debug Controls      | `<leader>db`, `<leader>dc`, etc. |
| Terminal Toggle     | `Ctrl+\`, `<leader>tf/th/tv`  |
| Flash Jump          | `s`, `S`, `r`, `R`            |
| Harpoon Files       | `<leader>a`, `<leader>1..4`   |
| Comment Toggle      | `gcc`, `gc` (Visual)          |

📘 For the complete keybinding reference, see: `neovim_keybindings_guide.pdf`

---

## 🧩 Supported Languages & Debuggers

### Language Servers:
- **C/C++:** `clangd`
- **Rust:** `rust-analyzer`
- **Python:** `pyright`
- **JavaScript/TypeScript:** `tsserver`
- **Lua:** `lua_ls`

### Debuggers:
- **Python:** `debugpy`
- **Rust/C++:** `codelldb`
- **JavaScript/Node.js:** `js-debug-adapter`

---

## 🧰 Tips & Best Practices

1. Use **Harpoon** for fast file switching.
2. **Telescope** is your go-to search interface.
3. Use **Flash.nvim** for efficient movement.
4. **Oil.nvim** lets you manage files like buffers.
5. **Gitsigns** provides gutter and hunk-based Git operations.
6. Discover keybindings with **Which-key** (`<leader>?`).
7. Let **Auto-save** protect your work silently.
8. Use **marks** and enhanced navigation tools for better workflow.

---

## 🛠 Customization

- All plugins live in `~/.config/nvim/lua/plugins/`
- Keybindings and settings are modular and editable per plugin
- Modify `init.lua` for global settings
- Use `:source %` or restart Neovim to apply changes

---

## 💻 Preview

> 🚀 Optimized for developers who want speed, control, and full plugin power.

---

## 📎 License

Feel free to fork, clone, and modify. Credits to all plugin authors.

---

