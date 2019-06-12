# 全般
## 日本語が文字化けしないよう文字コードを指定
export LANG=ja_JP.UTF-8
## 入力をEmacライクなモードにする
bindkey -e
## ビープ音を消す
setopt nolistbeep
## コマンドのtypoを指摘しない
setopt nocorrect

# 履歴
## 履歴ファイルの保存先
HISTFILE=~/.zsh_history
## メモリに保存される履歴の件数
HISTSIZE=10000
## HISTFILE で指定したファイルに保存される履歴の件数
SAVEHIST=10000
## 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups
## 履歴を複数の端末で共有する
setopt share_history

# 補完
## compinit(入力補完機能)を有効にする
autoload -Uz compinit && compinit
## 補完候補を詰めて表示
setopt list_packed
## 補完に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
## 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'

# プロンプト
## vcs_info(vcs情報の提供機能)を有効にする
autoload -Uz vcs_info
## PROMPT変数内で変数参照する
setopt prompt_subst
## vcs_info_msg_0_ のformatsを指定(%b=ブランチ名)
zstyle ':vcs_info:*' formats '[%F{green}%b%f]'
## vcs_info_msg_0_ のactionformatsを指定(%a=アクションを説明する識別子)
zstyle ':vcs_info:*' actionformats '[%F{green}%b%f(%F{red}%a%f)]'
## プロンプトの表示前にvcs_infoを実行
precmd() { vcs_info }
## 左プロンプトの表示を設定
PROMPT='[%n@%m][%~]${vcs_info_msg_0_}%(?..[%?]) $ '
## 右プロンプトの表示を設定
RPROMPT=''

# load variables
if [ -e $HOME/.zsh_variables ] ; then
  source $HOME/.zsh_variables
fi

# alias setting
alias ll='ls -laG'
alias gd='git branch --merged | grep -vE "^\*|master$|develop$" | xargs -I % git branch -d %'
alias g='cd $(ghq root)/$(ghq list | peco)'

# tool setting
## anyenv
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    # for tmux
    for D in `\ls $HOME/.anyenv/envs`
    do
        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    done
fi

## peco
peco-select-history() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

## golang
export GOPATH=$HOME/.go

# PATH setting
PATH=$PATH:/usr/local/bin
PATH=$PATH:$HOME/bin
PATH=$PATH:$GOPATH/bin
PATH=$PATH:~/.composer/vendor/bin
PATH=$PATH:./node_modules/.bin
PATH=$PATH:/usr/local/opt/mysql@5.6/bin
export PATH
