return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = { "python", "go", "gomod", "lua", "vim", "vimdoc", "markdown", "markdown_inline", "json", "yaml" },
            })
            vim.treesitter.language.register("markdown", "mdx")
        end,
    },
}
