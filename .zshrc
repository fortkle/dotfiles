PATH=$HOME/bin:~/.composer/vendor/bin:$PATH
#PATH=/usr/local/bin:$HOME/bin:$PATH
export PATH

# エイリアス
alias ll='ls -laG'

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

# tmux ssh-agent対策
AGENT_SOCK_FILE="$HOME/.ssh/ssh-agent-$USER"
SSH_AGENT_FILE="$HOME/.ssh-agent-info"
if test $SSH_AUTH_SOCK ; then
    if [ $SSH_AUTH_SOCK != $AGENT_SOCK_FILE ] ; then
        ln -sf $SSH_AUTH_SOCK $AGENT_SOCK_FILE
        export SSH_AUTH_SOCK=$AGENT_SOCK_FILE
    fi
else
    test -f $SSH_AGENT_FILE && source $SSH_AGENT_FILE
    if ! ssh-add -l >& /dev/null ; then
        ssh-agent > $SSH_AGENT_FILE
        source $SSH_AGENT_FILE
        ssh-add
    fi
fi
