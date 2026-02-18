# Neovim 配置

## 插件列表

| 插件 | 用途 |
|------|------|
| lazy.nvim | 插件管理器 |
| github-nvim-theme | 主题 |
| snacks.nvim | Dashboard + 通知 + Scratch |
| neo-tree.nvim | 文件树 |
| bufferline.nvim | Buffer 标签栏 |
| lualine.nvim | 状态栏 |
| noice.nvim | 命令行浮动窗口 |
| telescope.nvim | 模糊搜索 |
| Comment.nvim | 快捷注释 |
| aerial.nvim | 函数跳转 |
| trouble.nvim | 诊断列表 |
| render-markdown.nvim | Markdown 渲染 |
| nvim-autopairs | 自动配对括号 |
| flash.nvim | 快速跳转 |
| nvim-treesitter | 语法高亮 |
| mason.nvim | LSP 安装管理 |
| nvim-lspconfig | LSP 配置 |
| nvim-cmp | 代码补全 |
| gitsigns.nvim | Git 行内状态 |
| neogit | Git 操作界面 |
| diffview.nvim | Git diff 查看 |

## 依赖

```bash
brew install ripgrep
```

## 快捷键

Leader 键: `<Space>`

### 文件/搜索

| 快捷键 | 功能 |
|--------|------|
| `<leader>e` | 打开/关闭文件树 |
| `<leader>ff` | 搜索文件 |
| `<leader>fg` | 全局搜索关键字 |
| `<leader>/` | 当前文件内搜索 |
| `<leader>fb` | 搜索 Buffer |
| `<leader>fr` | 最近文件 |
| `<leader>o` | 函数列表 |

### 文件树 (neo-tree)

| 快捷键 | 功能 |
|--------|------|
| `j/k` | 上下移动 |
| `h` | 关闭节点 |
| `l` / `Enter` | 展开/打开 |
| `s` | 水平分屏打开 |
| `v` | 垂直分屏打开 |
| `a` | 新建文件/目录 |
| `d` | 删除 |
| `r` | 重命名 |
| `c` | 复制 |
| `m` | 移动 |
| `q` | 关闭文件树 |
| `R` | 刷新 |
| `H` | 显示/隐藏隐藏文件 |
| `E` | 文件系统视图 |
| `B` | Buffer 视图 |
| `G` | Git 状态视图 |

### LSP/代码

| 快捷键 | 功能 |
|--------|------|
| `gd` | 跳转定义 |
| `gr` | 查看引用 |
| `gk` | 显示文档 |
| `<leader>k` | 函数签名/入参 |
| `<leader>rn` | 重命名 |
| `<leader>ca` | Code Action |
| `[d` / `]d` | 上/下一个诊断 |
| `[f` / `]f` | 上/下一个函数 |
| `<leader>xx` | 打开诊断列表 |
| `<leader>xd` | 当前文件诊断 |

### 移动/跳转

| 快捷键 | 功能 |
|--------|------|
| `J` / `K` | 向下/上移动 5 行 |
| `s` | Flash 快速跳转 |
| `S` | Flash Treesitter 跳转 |
| `<D-o>` | 跳转返回 (Cmd+O) |
| `<D-i>` | 跳转前进 (Cmd+I) |
| `n` / `N` | 搜索结果居中 |

### Git

| 快捷键 | 功能 |
|--------|------|
| `<leader>gg` | 打开 Neogit |
| `<leader>gc` | Git commit |
| `<leader>gb` | Git blame 当前行 |
| `<leader>gd` | Git diff |
| `<leader>gh` | 文件历史 |
| `<leader>gp` | 预览 hunk |
| `<leader>gr` | 重置 hunk |
| `<leader>gS` | Stage hunk |
| `]c` / `[c` | 下/上一个 hunk |

### Neogit 内部快捷键

| 快捷键 | 功能 |
|--------|------|
| `s` | Stage 文件/hunk |
| `u` | Unstage |
| `c` | Commit |
| `p` | Push |
| `F` | Pull |
| `q` | 退出 |

### Buffer/窗口

| 快捷键 | 功能 |
|--------|------|
| `<S-h>` / `<S-l>` | 切换 Buffer |
| `Q` | 删除当前 Buffer |
| `<leader>bw` | 关闭当前 Buffer |
| `<leader>bo` | 关闭其他 Buffer |
| `<leader>.` | Scratch Buffer (临时缓冲区) |
| `<C-h/j/k/l>` | 窗口导航 |
| `<C-w>q` | 关闭当前窗口 |
| `<C-w>o` | 只保留当前窗口 |
| `<leader>z` | 切换 Zoom 模式 |

### 保存/退出

| 快捷键 | 功能 |
|--------|------|
| `<C-s>` | 保存（多模式） |
| `<leader>w` | 保存 |
| `<leader>q` | 退出 |
| `<leader>Q` | 强制退出 |
| `<leader>cc` | 关闭当前项目 |

### 编辑

| 快捷键 | 功能 |
|--------|------|
| `gcc` | 注释当前行 |
| `gc` (visual) | 注释选中区域 |
| `gj` | 合并行 (原 J) |
| `<` / `>` (visual) | 缩进并保持选中 |
| `p` (visual) | 粘贴不覆盖寄存器 |
| `jk` / `jj` | 快速退出插入模式 |

### Terminal

| 快捷键 | 功能 |
|--------|------|
| `<Esc><Esc>` | 退出终端模式 |
| `<C-h/j/k/l>` | 终端窗口导航 |

## 目录结构

```
~/.config/nvim/
├── init.lua
├── .luarc.json
└── lua/
    ├── core/
    │   ├── options.lua
    │   ├── keymaps.lua
    │   └── autocmds.lua
    └── plugins/
        ├── init.lua
        ├── ui.lua
        ├── editor.lua
        ├── lsp.lua
        ├── completion.lua
        ├── treesitter.lua
        └── git.lua
```
