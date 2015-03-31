# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# .bashrc for interactive terminal
[ -z "$PS1" ] && return

# use tmux
if [ -z $TMUX ]; then
  if $(tmux has-session); then
    tmux -2 attach
  else
    tmux -2
  fi
fi
