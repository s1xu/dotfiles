vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 保存退出
map({ "n", "i", "x" }, "<C-s>", "<cmd>w<cr>", opts)
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>q!<cr>", { desc = "Force quit" })
map("n", "<leader>cc", "<cmd>qa<cr>", { desc = "Close project" })
map("n", "Q", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- 取消高亮
map("n", "<Esc>", "<cmd>noh<cr><Esc>")

-- 窗口导航
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- 窗口大小调整
map("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
map("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- Buffer 切换
map("n", "<S-h>", "<cmd>bprevious<cr>", opts)
map("n", "<S-l>", "<cmd>bnext<cr>", opts)
map("n", "<leader>bw", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
map("n", "<leader>bo", "<cmd>%bd|e#|bd#<cr>", { desc = "Close other buffers" })

-- 快速上下移动 5 行
map({ "n", "v" }, "J", "5j", opts)
map({ "n", "v" }, "K", "5k", opts)

-- 搜索结果居中
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- 原 J/K 功能
map("n", "gj", "J", { desc = "Join lines" })
map("n", "gk", vim.lsp.buf.hover, { desc = "Hover doc" })

-- 跳转导航 (Cmd+O 返回, Cmd+I 前进)
map("n", "<D-o>", "<C-o>", { desc = "Jump back" })
map("n", "<D-i>", "<C-i>", { desc = "Jump forward" })

-- 系统剪贴板操作 (Cmd+C 复制, Cmd+V 粘贴)
map("v", "<D-c>", '"+y', { desc = "Copy to clipboard" })
map({ "n", "i" }, "<D-v>", '"+p', { desc = "Paste from clipboard" })

-- 保持视觉模式缩进
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- 粘贴不覆盖寄存器
map("v", "p", '"_dP', opts)

-- c/x/d/s 命令使用黑洞寄存器（不影响剪贴板）
map({ "n", "v" }, "c", '"_c', opts)
map({ "n", "v" }, "C", '"_C', opts)
map({ "n", "v" }, "x", '"_x', opts)
map({ "n", "v" }, "X", '"_X', opts)
map({ "n", "v" }, "d", '"_d', opts)
map({ "n", "v" }, "D", '"_D', opts)
map({ "n", "v" }, "s", '"_s', opts)
map({ "n", "v" }, "S", '"_S', opts)

-- 快速退出插入模式
map("i", "jk", "<Esc>", opts)
map("i", "jj", "<Esc>", opts)

-- Terminal 模式
map("t", "<Esc><Esc>", "<C-\\><C-n>", opts)
map("t", "<C-h>", "<cmd>wincmd h<cr>", opts)
map("t", "<C-j>", "<cmd>wincmd j<cr>", opts)
map("t", "<C-k>", "<cmd>wincmd k<cr>", opts)
map("t", "<C-l>", "<cmd>wincmd l<cr>", opts)

-- Zoom 模式
local zoomed = false
map("n", "<leader>z", function()
    if zoomed then
        vim.cmd("wincmd =")
        zoomed = false
    else
        vim.cmd("wincmd |")
        vim.cmd("wincmd _")
        zoomed = true
    end
end, { desc = "Toggle zoom" })
