local autocmd = vim.api.nvim_create_autocmd

-- 高亮复制内容
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- 打开文件时恢复光标位置
autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- 自动创建目录
autocmd("BufWritePre", {
    callback = function(event)
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- 打开目录时自动启动 neo-tree
autocmd("VimEnter", {
    callback = function()
        local arg = vim.fn.argv(0)
        if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
            vim.schedule(function()
                require("neo-tree.command").execute({ dir = arg })
            end)
        end
    end,
})

-- 清理空 buffer 和目录 buffer
autocmd("BufEnter", {
    callback = function()
        vim.schedule(function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                if vim.api.nvim_buf_is_valid(buf) and buf ~= vim.api.nvim_get_current_buf() then
                    local name = vim.api.nvim_buf_get_name(buf)
                    local is_empty = name == ""
                        and vim.bo[buf].buftype == ""
                        and vim.api.nvim_buf_line_count(buf) == 1
                        and vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] == ""
                    local is_dir = name ~= "" and vim.fn.isdirectory(name) == 1
                    if is_empty or is_dir then
                        pcall(vim.api.nvim_buf_delete, buf, { force = true })
                    end
                end
            end
        end)
    end,
})
