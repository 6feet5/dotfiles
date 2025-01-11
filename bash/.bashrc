# file:     ~/.bashrc
# author:   johan stenarson - stenarson.com
#------------------------------------------

# Do nothing, unless running interactively
[[ $- != *i* ]] && return

[[ -f ~/.config/aliases ]] && . ~/.config/aliases
[[ -f ~/.dir_colors ]] && eval $(dircolors ~/.dir_colors)

export BROWSER=qutebrowser
export EDITOR=vim
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL="ignoreboth"
# Syntax highlighting in less
export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS="-R --ignore-case --hilite-search"
export SYSTEMD_LESS="${LESS}"
export TERMINFO=~/.terminfo
export MPD_HOST=raspberrypi.lan

eval $(keychain --eval --quiet --agents gpg,ssh id_rsa)

. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#bdae93,fg+:#ebdbb2,bg:#282828,bg+:#3c3836
  --color=hl:#fabd2f,hl+:#fabd2f,info:#fabd2f,marker:#8ec07c
  --color=prompt:#fabd2f,spinner:#8ec07c,pointer:#8ec07c,header:#83a598
  --color=border:#262626,label:#aeaeae,query:#d9d9d9'

eval "$(starship init bash)"
