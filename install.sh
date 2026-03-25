#!/bin/bash

# Dotfiles 安装脚本
# 用途：创建符号链接，将配置文件链接到系统对应位置

set -e

DOTFILE_DIR="$HOME/dotfiles"

# --- 备份函数 ---
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

# --- 安装函数 ---
install_ghostty() {
    echo "📦 安装 Ghostty 配置..."
    mkdir -p ~/.config/ghostty
    backup_file ~/.config/ghostty/config
    ln -sf "$DOTFILE_DIR/ghostty/config" ~/.config/ghostty/config
}

install_neovim() {
    echo "📦 安装 Neovim 配置..."
    backup_dir ~/.config/nvim
    ln -sf "$DOTFILE_DIR/nvim" ~/.config/nvim
}

install_vscode() {
    echo "📦 安装 VSCode 配置..."
    local vscode_dir="$HOME/Library/Application Support/Code/User"
    backup_file "$vscode_dir/settings.json"
    backup_file "$vscode_dir/keybindings.json"
    ln -sf "$DOTFILE_DIR/vscode/settings.json" "$vscode_dir/settings.json"
    ln -sf "$DOTFILE_DIR/vscode/keybindings.json" "$vscode_dir/keybindings.json"
    if [ -d "$DOTFILE_DIR/vscode/snippets" ]; then
        backup_dir "$vscode_dir/snippets"
        rm -rf "$vscode_dir/snippets"
        ln -sf "$DOTFILE_DIR/vscode/snippets" "$vscode_dir/snippets"
    fi
}

install_rime() {
    echo "📦 安装 Rime 配置..."
    for file in "$DOTFILE_DIR/rime"/*.yaml; do
        if [ -f "$file" ]; then
            filename=$(basename "$file")
            backup_file ~/Library/Rime/"$filename"
            ln -sf "$file" ~/Library/Rime/"$filename"
        fi
    done
}

install_tmux() {
    echo "📦 安装 Tmux 配置..."
    mkdir -p ~/.config/tmux
    backup_file ~/.config/tmux/tmux.conf
    ln -sf "$DOTFILE_DIR/tmux/tmux.conf" ~/.config/tmux/tmux.conf
}

install_ideavim() {
    echo "📦 安装 IdeaVim 配置..."
    backup_file ~/.ideavimrc
    ln -sf "$DOTFILE_DIR/ideavim/.ideavimrc" ~/.ideavimrc
}

install_zsh() {
    echo "📦 安装 Zsh 配置..."
    backup_file ~/.zshrc
    ln -sf "$DOTFILE_DIR/zsh/.zshrc" ~/.zshrc
}

# --- 模块列表 ---
modules=("Ghostty" "Neovim" "VSCode" "Rime" "Tmux" "IdeaVim" "Zsh")
installers=(install_ghostty install_neovim install_vscode install_rime install_tmux install_ideavim install_zsh)

# --- 交互式菜单 ---
echo "🚀 Dotfiles 安装脚本"
echo ""

if [ -t 0 ]; then
    echo "请选择要安装的配置（空格分隔，回车全部安装）："
    for i in "${!modules[@]}"; do
        echo "  $((i+1))) ${modules[$i]}"
    done
    echo ""
    read -rp "> " choices
    if [ -z "$choices" ]; then
        selected=("${!modules[@]}")
    else
        selected=()
        for num in $choices; do
            if ! [[ "$num" =~ ^[0-9]+$ ]] || [ "$num" -lt 1 ] || [ "$num" -gt ${#modules[@]} ]; then
                echo "❌ 无效选项: $num（请输入 1-${#modules[@]}）"
                exit 1
            fi
            selected+=($((num-1)))
        done
    fi
else
    echo "检测到非交互模式，安装全部配置..."
    selected=("${!modules[@]}")
fi

echo ""
for i in "${selected[@]}"; do
    ${installers[$i]}
done

echo ""
echo "✨ 安装完成！"
echo ""
echo "📝 后续步骤："
echo "  1. 重启相关应用以加载新配置"
echo "  2. Rime 需要重新部署（Ctrl+Option+\`）"
echo "  3. 重启 JetBrains IDE 以加载 IdeaVim 配置"
echo ""
echo "💡 提示："
echo "  - 原配置文件已备份为 .backup 后缀"
echo "  - 如需恢复，可以从备份文件还原"
