export GOPATH=$HOME/Private/go
PATH=$HOME/bin:~/.composer/vendor/bin:$PATH
PATH=/usr/local/bin:$HOME/bin:$PATH
PATH=$GOPATH/bin:$PATH
PATH=$PATH:./node_modules/.bin
export PATH

# anyenv
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    # for tmux
    for D in `\ls $HOME/.anyenv/envs`
    do
        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    done
fi

# エイリアス
alias ll='ls -laG'
alias gd='git branch --merged | grep -vE "^\*|master$|develop$" | xargs -I % git branch -d %'

# 日本語が文字化けしないよう文字コードを指定
export LANG=ja_JP.UTF-8

# プロンプト（ユーザー名・ホスト名・カレントディレクトリ）
autoload -Uz vcs_info ## vcs_infoロード
setopt prompt_subst ## PROMPT変数内で変数参照する
zstyle ':vcs_info:*' formats '[%F{green}%b%f]' # vcsの表示
zstyle ':vcs_info:*' actionformats '[%F{green}%b%f(%F{red}%a%f)]' # vcsの表示
precmd() { vcs_info }
PROMPT='[%n@%m][%~]${vcs_info_msg_0_} $ '
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
