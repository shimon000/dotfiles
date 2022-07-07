source $HOME/.zplug/init.zsh
source /usr/local/src/enhancd/init.sh
# プロンプトの設定
PROMPT="%F{240}[%d]%f"$'\n'

# deno関連の設定
export DENO_INSTALL="/$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'b4b4r07/enhancd'
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Then, source plugins and add commands to $PATH
zplug load
