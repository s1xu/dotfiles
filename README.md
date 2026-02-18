# My Dotfiles

我的个人配置文件集合，包含常用开发工具的配置。

## 📦 包含的配置

- **Ghostty**: 终端模拟器配置
- **Neovim**: 编辑器配置（基于 Lazy.nvim）
- **VSCode**: 编辑器设置、快捷键、代码片段
- **Rime**: 输入法配置（小鹤双拼 + 明月拼音）

## 🚀 快速开始

### 全新安装

```bash
# 1. 克隆仓库
git clone https://github.com/s1xu/dotfiles.git ~/dotfiles

# 2. 运行安装脚本
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

### 更新配置

配置文件通过符号链接管理，直接修改原位置的文件即可：

```bash
cd ~/dotfiles
git add .
git commit -m "更新配置"
git push
```

## 📁 目录结构

```
dotfiles/
├── ghostty/          # Ghostty 终端配置
│   └── config
├── nvim/             # Neovim 配置
│   ├── init.lua
│   ├── lazy-lock.json
│   └── lua/
├── vscode/           # VSCode 配置
│   ├── settings.json
│   ├── keybindings.json
│   └── snippets/
├── rime/             # Rime 输入法配置
│   ├── default.custom.yaml
│   ├── squirrel.custom.yaml
│   ├── double_pinyin_flypy.custom.yaml
│   ├── double_pinyin_flypy.schema.yaml
│   └── luna_pinyin_simp.custom.yaml
├── install.sh        # 安装脚本
├── .gitignore        # Git 忽略规则
└── README.md         # 说明文档
```

## ⚠️ 注意事项

- 安装脚本会自动备份现有配置到 `.backup` 后缀
- Rime 配置安装后需要重新部署（Ctrl+Option+`）
- VSCode 的扩展需要手动安装

## 🔄 同步到新机器

```bash
git clone https://github.com/s1xu/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## 📝 配置文件说明

### Ghostty
- `config`: 终端外观、字体、快捷键等配置

### Neovim
- `init.lua`: 入口配置文件
- `lua/core/`: 核心配置（选项、快捷键、自动命令）
- `lua/plugins/`: 插件配置
- `lazy-lock.json`: 插件版本锁定文件

### VSCode
- `settings.json`: 编辑器设置
- `keybindings.json`: 快捷键绑定
- `snippets/`: 自定义代码片段

### Rime
- `default.custom.yaml`: 全局配置
- `squirrel.custom.yaml`: 鼠须管外观配置
- `double_pinyin_flypy.custom.yaml`: 小鹤双拼配置
- `luna_pinyin_simp.custom.yaml`: 明月拼音简体配置
