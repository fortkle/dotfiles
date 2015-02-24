PATH=$HOME/bin:$PATH
export PATH

export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

# 日本語が文字化けしないよう文字コードを指定
export LANG=ja_JP.UTF-8

# プロンプト（ユーザー名・ホスト名・カレントディレクトリ）
PROMPT='[%n@%m][%~] $ '
RPROMPT=''

# 入力補完をする
autoload -U compinit && compinit

# コマンドをtypoしたときに訂正する
setopt nocorrect

# 補完候補を詰めて表示
setopt list_packed

# ビープ音を消す
setopt nolistbeep

# 入力をEmacライクなモードにする
bindkey -e

# 補完に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'

# 履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

# peco
## 履歴
peco-select-history() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history