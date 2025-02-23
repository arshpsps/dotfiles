-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.diagnostic.config({
    virtual_text = false,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = false,
})

vim.g.autoformat = false



-- specifying tabs
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- disable netrw because it's fking trash
vim.cmd("let g:loaded_netrw = 1")
vim.cmd("let g:loaded_netrwPlugin = 1")

-- instead of neotree or netrw show telescope file browser.
-- local grp = vim.api.nvim_create_augroup("BrowserStartup", { clear = false })
-- vim.api.nvim_create_autocmd("UIEnter", {
--     group = grp,
--     command = "Telescope file_browser",
-- })
