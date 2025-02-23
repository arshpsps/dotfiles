vim.keymap.set("n", "<leader>fi", function()
    local current_word = vim.fn.expand("<cword>")
    local _ = vim.bo.filetype

    vim.fn.jobstart(
        "curl -L -s 'https://registry.hub.docker.com/v2/repositories/library/"
            .. current_word
            .. '/tags?page_size=100\' | jq -r \'.results[] | .name + ": " + (.full_size/1000000|tostring) + "mb"\'',
        {
            stdout_buffered = true,
            on_stdout = function(_, d)
                if d then
                    vim.api.nvim_buf_set_lines(0, 0, -1, false, d)
                end
            end,
            on_stderr = function(_, d)
                if d then
                    vim.api.nvim_buf_set_lines(0, -1, -1, false, d)
                end
            end,
        }
    )

    -- golang

    local width = 70
    local height = 10

    local buf = vim.api.nvim_create_buf(false, true)

    local opt = {
        title = "Showing docker image tags for: " .. current_word,
        title_pos = "center",
        relative = "cursor",
        width = width,
        height = height,
        col = 1,
        row = 2,
        anchor = "NW",
        style = "minimal",
        border = "rounded",
    }

    local win = vim.api.nvim_open_win(buf, true, opt)

    vim.api.nvim_buf_set_lines(0, 0, -1, false, { "fetching image tags for " .. current_word })
    -- vim.api.nvim_buf_set_option(0, "readonly", true)
    -- vim.api.nvim_buf_set_option(0, "modifiable", false)
    vim.api.nvim_win_set_option(win, "winhl", "Normal:" .. vim.g.colors_name:gsub("[^a-zA-Z0-9_]", "_") .. "Normal")
end, { desc = "[F]etch [I]mage tags"})
