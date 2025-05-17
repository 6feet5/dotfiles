# file:     ~/.bashrc
# author:   johan stenarson - stenarson.com
#------------------------------------------

# Do nothing, unless running interactively
[[ $- != *i* ]] && return

[[ -f ~/.aliases ]] && . ~/.aliases
[[ -f ~/.dir_colors ]] && eval $(dircolors ~/.dir_colors)

# Sensible bash
PROMPT_COMMAND='history -a'
export HISTSIZE=500000
export HISTFILESIZE=100000
export HISTCONTROL='erasedups:ignoreboth'
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history"
shopt -s checkwinsize
shopt -s histappend
shopt -s cmdhist
shopt -s autocd
shopt -s dirspell
shopt -s cdspell
shopt -s cdable_vars

export dotfiles="$HOME/github/dotfiles"

export BROWSER=qutebrowser
export EDITOR=vim
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
# Syntax highlighting in less
export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS="-R --ignore-case --hilite-search"
export SYSTEMD_LESS="${LESS}"
export TERMINFO=~/.terminfo
export MPD_HOST=raspberrypi.lan

. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#bdae93,fg+:#ebdbb2,bg:#282828,bg+:#3c3836
  --color=hl:#fabd2f,hl+:#fabd2f,info:#fabd2f,marker:#8ec07c
  --color=prompt:#fabd2f,spinner:#8ec07c,pointer:#8ec07c,header:#83a598
  --color=border:#262626,label:#aeaeae,query:#d9d9d9'

eval "$(starship init bash)"
