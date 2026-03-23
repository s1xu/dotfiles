# --- Oh-My-Zsh ---
export ZSH="$HOME/.oh-my-zsh"
DISABLE_AUTO_TITLE="true"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source "$ZSH/oh-my-zsh.sh"

# --- Environment ---
export LANG=en_US.UTF-8

# --- PATH ---
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/usr/local/mysql/bin"
export PATH="$HOME/.local/bin:$PATH"

# --- Alias ---
alias c='clear'
alias ll='ls -lrth'
alias vi='nvim'

# --- Functions ---
# 输入 .git 结尾的 URL 自动 clone 到 ~/github-temp
git-clone-temp() {
    local target_dir="$HOME/github-temp"
    mkdir -p "$target_dir"
    git clone --depth 1 "$1" "$target_dir/$(basename "$1" .git)"
}
alias -s git="git-clone-temp"

# Java 版本快速切换
_java_switch() {
    local version=$1 java_home=$2
    export JAVA_HOME="$java_home"
    export PATH="$JAVA_HOME/bin:$PATH"
    echo "$version" > "$HOME/.java_version"
    echo "✅ 已切换到 Java $version"
    java -version
}
java8()  { _java_switch 8  "/Library/Java/JavaVirtualMachines/jdk1.8.0_341.jdk/Contents/Home"; }
java17() { _java_switch 17 "$HOME/Library/Java/JavaVirtualMachines/ms-17.0.17/Contents/Home"; }
java21() { _java_switch 21 "$HOME/Library/Java/JavaVirtualMachines/openjdk-21.0.1/Contents/Home"; }

# --- Version Managers ---
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
source "/opt/homebrew/opt/nvm/nvm.sh"

if [[ -z "$GVM_ROOT" && -s "$HOME/.gvm/scripts/gvm" ]]; then
    source "$HOME/.gvm/scripts/gvm"
fi

# --- Java ---
_java_version=${$(cat "$HOME/.java_version" 2>/dev/null):-17}
case "$_java_version" in
    8)  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_341.jdk/Contents/Home" ;;
    17) export JAVA_HOME="$HOME/Library/Java/JavaVirtualMachines/ms-17.0.17/Contents/Home" ;;
    21) export JAVA_HOME="$HOME/Library/Java/JavaVirtualMachines/openjdk-21.0.1/Contents/Home" ;;
esac
export PATH="$JAVA_HOME/bin:$PATH"
unset _java_version

# --- Proxy ---
proxy_info=$(scutil --proxy)
if [ "$(echo "$proxy_info" | awk '/HTTPEnable/ {print $3}')" = "1" ]; then
    http_host=$(echo "$proxy_info" | awk '/HTTPProxy/ {print $3}')
    http_port=$(echo "$proxy_info" | awk '/HTTPPort/ {print $3}')
    export http_proxy="http://${http_host}:${http_port}"
else
    unset http_proxy
fi
if [ "$(echo "$proxy_info" | awk '/HTTPSEnable/ {print $3}')" = "1" ]; then
    https_host=$(echo "$proxy_info" | awk '/HTTPSProxy/ {print $3}')
    https_port=$(echo "$proxy_info" | awk '/HTTPSPort/ {print $3}')
    export https_proxy="http://${https_host}:${https_port}"
else
    unset https_proxy
fi
if [ "$(echo "$proxy_info" | awk '/SOCKSEnable/ {print $3}')" = "1" ]; then
    socks_host=$(echo "$proxy_info" | awk '/SOCKSProxy/ {print $3}')
    socks_port=$(echo "$proxy_info" | awk '/SOCKSPort/ {print $3}')
    export all_proxy="socks5://${socks_host}:${socks_port}"
else
    unset all_proxy
fi
unset proxy_info

# --- Tools ---
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
eval "$(zoxide init zsh)"
