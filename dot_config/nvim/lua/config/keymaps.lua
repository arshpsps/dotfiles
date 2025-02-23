-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

local set_keymap = vim.keymap.set

-- Indent on pressing tab and shift-tab
set_keymap("n", "<Tab>", ">>", opts)
set_keymap("n", "<S-Tab>", "<<", opts)
set_keymap("v", "<Tab>", ">gv", opts)
set_keymap("v", "<S-Tab>", "<gv", opts)

-- harpoon keymaps
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

set_keymap("n", "<leader>a", mark.add_file, { desc = "[A]dd to harpoon" })
set_keymap("n", "<leader>h", ui.toggle_quick_menu, { desc = "Toggle [H]arpoon" })

-- clears the quickfix list
set_keymap("n", "<leader>xc", ":cexp []<CR>", { desc = "[C]lears quickfix list" })
-- set_keymap("n", "<leader>nf", "<cmd>Neotree focus<cr>", {desc = "[N]eotree [F]ocus"})
