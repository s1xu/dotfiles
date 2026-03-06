# My Dotfiles

我的个人配置文件集合，包含常用开发工具的配置。

## 📦 包含的配置

- **Ghostty**: 终端模拟器配置
- **Neovim**: 编辑器配置（基于 Lazy.nvim）
- **VSCode**: 编辑器设置、快捷键、代码片段
- **Rime**: 输入法配置（小鹤双拼 + 明月拼音）
- **Tmux**: 终端复用器配置
- **IdeaVim**: JetBrains IDE 的 Vim 模拟器配置

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
├── tmux/             # Tmux 配置
│   └── tmux.conf
├── ideavim/          # IdeaVim 配置
│   └── .ideavimrc
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

### Tmux
- `tmux.conf`: 终端复用器配置（快捷键、鼠标支持、颜色等）

### IdeaVim
- `.ideavimrc`: JetBrains IDE 的 Vim 模拟器配置文件

## 🔙 恢复原配置

如果需要恢复到安装 dotfiles 之前的配置，所有原配置文件都已自动备份。

### 备份文件位置

安装脚本会将原配置备份到以下位置：

```
~/.config/nvim.backup/                                          # Neovim 配置
~/.config/ghostty/config.backup                                 # Ghostty 配置
~/.config/tmux/tmux.conf.backup                                 # Tmux 配置
~/Library/Application Support/Code/User/settings.json.backup   # VSCode 设置
~/Library/Application Support/Code/User/keybindings.json.backup # VSCode 快捷键
~/Library/Application Support/Code/User/snippets.backup/       # VSCode 代码片段
~/Library/Rime/*.yaml.backup                                    # Rime 配置文件
~/.ideavimrc.backup                                             # IdeaVim 配置
```

### 恢复步骤

#### 1. 删除符号链接

```bash
# 删除 Neovim 符号链接
rm ~/.config/nvim

# 删除 Ghostty 符号链接
rm ~/.config/ghostty/config

# 删除 Tmux 符号链接
rm ~/.config/tmux/tmux.conf

# 删除 VSCode 符号链接
rm ~/Library/Application\ Support/Code/User/settings.json
rm ~/Library/Application\ Support/Code/User/keybindings.json
rm ~/Library/Application\ Support/Code/User/snippets

# 删除 Rime 符号链接
rm ~/Library/Rime/default.custom.yaml
rm ~/Library/Rime/double_pinyin_flypy.custom.yaml
rm ~/Library/Rime/double_pinyin_flypy.schema.yaml
rm ~/Library/Rime/luna_pinyin_simp.custom.yaml
rm ~/Library/Rime/squirrel.custom.yaml

# 删除 IdeaVim 符号链接
rm ~/.ideavimrc
```

#### 2. 恢复备份文件

```bash
# 恢复 Neovim 配置
mv ~/.config/nvim.backup ~/.config/nvim

# 恢复 Ghostty 配置
mv ~/.config/ghostty/config.backup ~/.config/ghostty/config

# 恢复 Tmux 配置
mv ~/.config/tmux/tmux.conf.backup ~/.config/tmux/tmux.conf

# 恢复 VSCode 配置
mv ~/Library/Application\ Support/Code/User/settings.json.backup \
   ~/Library/Application\ Support/Code/User/settings.json
mv ~/Library/Application\ Support/Code/User/keybindings.json.backup \
   ~/Library/Application\ Support/Code/User/keybindings.json
mv ~/Library/Application\ Support/Code/User/snippets.backup \
   ~/Library/Application\ Support/Code/User/snippets

# 恢复 Rime 配置
mv ~/Library/Rime/default.custom.yaml.backup \
   ~/Library/Rime/default.custom.yaml
mv ~/Library/Rime/double_pinyin_flypy.custom.yaml.backup \
   ~/Library/Rime/double_pinyin_flypy.custom.yaml
mv ~/Library/Rime/double_pinyin_flypy.schema.yaml.backup \
   ~/Library/Rime/double_pinyin_flypy.schema.yaml
mv ~/Library/Rime/luna_pinyin_simp.custom.yaml.backup \
   ~/Library/Rime/luna_pinyin_simp.custom.yaml
mv ~/Library/Rime/squirrel.custom.yaml.backup \
   ~/Library/Rime/squirrel.custom.yaml

# 恢复 IdeaVim 配置
mv ~/.ideavimrc.backup ~/.ideavimrc
```

#### 3. 重启应用

```bash
# 重启 VSCode
# 重启 Ghostty
# 重启 JetBrains IDE
# Rime 重新部署：Ctrl+Option+`
```

### 快速恢复（一键命令）

如果需要快速恢复所有配置，可以复制以下命令：

```bash
# 删除所有符号链接并恢复备份
rm ~/.config/nvim && mv ~/.config/nvim.backup ~/.config/nvim
rm ~/.config/ghostty/config && mv ~/.config/ghostty/config.backup ~/.config/ghostty/config
rm ~/.config/tmux/tmux.conf && mv ~/.config/tmux/tmux.conf.backup ~/.config/tmux/tmux.conf
rm ~/Library/Application\ Support/Code/User/settings.json && \
  mv ~/Library/Application\ Support/Code/User/settings.json.backup \
     ~/Library/Application\ Support/Code/User/settings.json
rm ~/Library/Application\ Support/Code/User/keybindings.json && \
  mv ~/Library/Application\ Support/Code/User/keybindings.json.backup \
     ~/Library/Application\ Support/Code/User/keybindings.json
rm ~/Library/Application\ Support/Code/User/snippets && \
  mv ~/Library/Application\ Support/Code/User/snippets.backup \
     ~/Library/Application\ Support/Code/User/snippets
rm ~/.ideavimrc && mv ~/.ideavimrc.backup ~/.ideavimrc

# 恢复 Rime 配置
cd ~/Library/Rime
for file in *.yaml.backup; do
  mv "$file" "${file%.backup}"
done
```

### 注意事项

- ⚠️ 恢复后，dotfiles 目录中的配置将不再生效
- ⚠️ 如果要重新使用 dotfiles，需要再次运行 `./install.sh`
- 💡 建议在确认 dotfiles 配置稳定后，再删除备份文件以节省空间
