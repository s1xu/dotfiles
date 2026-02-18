return {
    -- 主题
    {
        "projekt0n/github-nvim-theme",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("github_dark")
        end,
    },

    -- Snacks (dashboard + notifier)
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        keys = {
            { "<leader>.", function() Snacks.scratch() end, desc = "Scratch Buffer" },
        },
        opts = {
            scratch = { enabled = true },
            dashboard = {
                enabled = true,
                sections = {
                    { section = "header" },
                    { section = "keys", gap = 1, padding = 1 },
                    { section = "recent_files", limit = 8, padding = 1 },
                    { section = "startup" },
                },
            },
            notifier = { enabled = true },
        },
    },

    -- 文件树
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file tree" },
        },
        opts = {
            filesystem = {
                follow_current_file = { enabled = true },
                filtered_items = { visible = true },
                group_empty_dirs = true,
            },
            window = {
                width = 30,
                mappings = {
                    ["h"] = "close_node",
                    ["l"] = "open",
                    ["<cr>"] = "open",
                    ["s"] = "open_split",
                    ["v"] = "open_vsplit",
                    ["a"] = { "add", config = { show_path = "relative" } },
                    ["d"] = "delete",
                    ["r"] = "rename",
                    ["c"] = "copy",
                    ["m"] = "move",
                    ["q"] = "close_window",
                    ["R"] = "refresh",
                    ["?"] = "show_help",
                },
            },
        },
    },

    -- Buffer 标签栏
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                mode = "buffers",
                diagnostics = "nvim_lsp",
                show_tab_indicators = false,
                offsets = {
                    { filetype = "neo-tree", text = "File Explorer", text_align = "center" },
                },
            },
        },
    },

    -- 状态栏
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                globalstatus = true,
            },
        },
    },

    -- 命令行浮动窗口
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
            },
        },
    },
}
