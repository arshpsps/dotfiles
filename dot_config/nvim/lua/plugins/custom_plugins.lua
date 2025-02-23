return {
    "thePrimeagen/harpoon",
    "rebelot/kanagawa.nvim",
    "L3MON4D3/LuaSnip",
    {
        "norcalli/nvim-colorizer.lua",
    },
    {
        "iamcco/markdown-preview.nvim",
        config = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    -- "lunarvim/synthwave84.nvim"

    -- color theme
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    -- preview when renaming
    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        config = true,
    },

    -- Refactoring tool
    {
        "ThePrimeagen/refactoring.nvim",
        keys = {
            {
                "<leader>r",
                function()
                    require("refactoring").select_refactor()
                end,
                mode = "v",
                noremap = true,
                silent = true,
                expr = false,
            },
        },
        opts = {},
    },
    {
        "rcarriga/neotest",
        dependencies = {
            "marilari88/neotest-vitest",
            "nvim-neotest/neotest-go",
            "rcasia/neotest-java",
        },
        opts = {
            adapters = {
                ["neotest-go"] = {
                    args = { "-tags=integration" },
                },
                ["neotest-vitest"] = {},
                ["neotest-java"] = {},
            },
        },
    },

    -- mason
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "stylua",
                "selene",
                "luacheck",
                "tailwindcss-language-server",
                "typescript-language-server",
                "css-lsp",

                "pyright",
                "black",

                "shellcheck",
                "shfmt",

                "dockerfile-language-server",
                "docker-compose-language-service",
            })
        end,
    },

    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = true,
        opts = ...,
    },
    "ThePrimeagen/git-worktree.nvim",

    {
        "sainnhe/gruvbox-material",
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- obsidian.nvim
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
        --   -- refer to `:h file-pattern` for more examples
        --   "BufReadPre path/to/my-vault/*.md",
        --   "BufNewFile path/to/my-vault/*.md",
        -- },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        opts = {
            workspaces = {
                {
                    name = "class",

                    path = "/mnt/c/Home/misc/data/study/notes",
                },
                {
                    name = "CollegeResources",

                    path = "/mnt/c/Home/misc/data/dev/projects/bharatm29/CollegeResources",
                },
            },

            -- see below for full list of options 👇
        },
    },
    {
        "snacks.nvim",
        opts = {
            scroll = { enabled = false },
        },
    },
}
