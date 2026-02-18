return {
    -- Git 行内状态
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local map = function(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                end
                map("n", "]c", gs.next_hunk, "Next hunk")
                map("n", "[c", gs.prev_hunk, "Prev hunk")
                map("n", "<leader>gb", gs.blame_line, "Blame line")
                map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
                map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
                map("n", "<leader>gS", gs.stage_hunk, "Stage hunk")
            end,
        },
    },

    -- Neogit
    {
        "NeogitOrg/neogit",
        cmd = "Neogit",
        dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
        keys = {
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
            { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Git commit" },
        },
        opts = {
            integrations = { diffview = true },
        },
    },

    -- Git diff 查看
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff view" },
            { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
        },
        opts = {
            keymaps = {
                view = { ["q"] = "<cmd>DiffviewClose<cr>" },
                file_panel = { ["q"] = "<cmd>DiffviewClose<cr>" },
                file_history_panel = { ["q"] = "<cmd>DiffviewClose<cr>" },
            },
        },
    },
}
