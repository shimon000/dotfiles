alias  gl='cd /mnt/c/Users/user/Documents/アプリケーション/Python'
#カレントディレクトリの設定
source ~/.zplug/init.zsh

PROMPT="%F{240}[%d]%f"$'\n'

export DENO_INSTALL="/$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
