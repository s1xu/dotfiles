#!/bin/bash

# Dotfiles 安装脚本
# 用途：创建符号链接，将配置文件链接到系统对应位置

set -e

DOTFILE_DIR="$HOME/dotfiles"

# ====================== 备份函数 ======================
backup_file() {
    local file=$1
    if [ -f "$file" ] && [ ! -L "$file" ]; then
        echo "⚠️  备份 $file 到 ${file}.backup"
        cp "$file" "${file}.backup"
    fi
}

backup_dir() {
    local dir=$1
    if [ -d "$dir" ] && [ ! -L "$dir" ]; then
        echo "⚠️  备份 $dir 到 ${dir}.backup"
        cp -r "$dir" "${dir}.backup"
    fi
}

echo "🚀 开始安装 dotfiles..."

# ====================== 1. Ghostty 配置 ======================
echo "📦 安装 Ghostty 配置..."
mkdir -p ~/.config/ghostty
backup_file ~/.config/ghostty/config
ln -sf "$DOTFILE_DIR/ghostty/config" ~/.config/ghostty/config

# ====================== 2. Neovim 配置 ======================
echo "📦 安装 Neovim 配置..."
backup_dir ~/.config/nvim
ln -sf "$DOTFILE_DIR/nvim" ~/.config/nvim

# ====================== 3. VSCode 配置 ======================
echo "📦 安装 VSCode 配置..."
VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"

# 备份 VSCode 配置文件
backup_file "$VSCODE_USER_DIR/settings.json"
backup_file "$VSCODE_USER_DIR/keybindings.json"

# 创建符号链接
ln -sf "$DOTFILE_DIR/vscode/settings.json" "$VSCODE_USER_DIR/settings.json"
ln -sf "$DOTFILE_DIR/vscode/keybindings.json" "$VSCODE_USER_DIR/keybindings.json"

# 备份并链接 snippets 目录
if [ -d "$DOTFILE_DIR/vscode/snippets" ]; then
    backup_dir "$VSCODE_USER_DIR/snippets"
    rm -rf "$VSCODE_USER_DIR/snippets"
    ln -sf "$DOTFILE_DIR/vscode/snippets" "$VSCODE_USER_DIR/snippets"
fi

# ====================== 4. Rime 配置 ======================
echo "📦 安装 Rime 配置..."
for file in "$DOTFILE_DIR/rime"/*.yaml; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        backup_file ~/Library/Rime/"$filename"
        ln -sf "$file" ~/Library/Rime/"$filename"
    fi
done

# ====================== 5. Tmux 配置 ======================
echo "📦 安装 Tmux 配置..."
mkdir -p ~/.config/tmux
backup_file ~/.config/tmux/tmux.conf
ln -sf "$DOTFILE_DIR/tmux/tmux.conf" ~/.config/tmux/tmux.conf

# ====================== 6. IdeaVim 配置 ======================
echo "📦 安装 IdeaVim 配置..."
backup_file ~/.ideavimrc
ln -sf "$DOTFILE_DIR/ideavim/.ideavimrc" ~/.ideavimrc

# ====================== 7. Zsh 配置 ======================
echo "📦 安装 Zsh 配置..."
backup_file ~/.zshrc
ln -sf "$DOTFILE_DIR/zsh/.zshrc" ~/.zshrc

echo ""
echo ""
echo "📝 后续步骤："
echo "  1. 重启相关应用以加载新配置"
echo "  2. Rime 需要重新部署（Ctrl+Option+\`）"
echo "  3. 重启 JetBrains IDE 以加载 IdeaVim 配置"
echo ""
echo "💡 提示："
echo "  - 原配置文件已备份为 .backup 后缀"
echo "  - 如需恢复，可以从备份文件还原"
