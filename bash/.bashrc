# file:     ~/.bashrc
# author:   johan stenarson - stenarson.com
#------------------------------------------

# Do nothing, unless running interactively
[[ $- != *i* ]] && return

[[ -f ~/.config/aliases ]] && . ~/.config/aliases
[[ -f ~/.dir_colors ]] && eval $(dircolors ~/.dir_colors)

export BROWSER=qutebrowser
export EDITOR=nvim
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL="ignoreboth"
# Syntax highlighting in less
export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS="-R --ignore-case --hilite-search"
export SYSTEMD_LESS="${LESS}"
export TERMINFO=~/.terminfo
export MPD_HOST=192.168.1.121

eval $(keychain --eval --quiet --agents gpg,ssh id_rsa)

. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash

eval "$(starship init bash)"
