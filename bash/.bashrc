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

# Perhaps not so sensible bash
set -o vi

export BROWSER=qutebrowser
export EDITOR=nvim
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
# Syntax highlighting in less
export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS="-R --ignore-case --hilite-search"
export SYSTEMD_LESS="${LESS}"
export TERMINFO=~/.terminfo
export MPD_HOST=raspberrypi.lan

. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

export FZF_DEFAULT_COMMAND='fd --hidden --type l --type f --type d --exclude .git --exclude .cache'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --hidden --type d --exclude .git --exclude .cache'

bind '"\C-f":"tmux-sessionizer.sh\n"'

eval "$(starship init bash)"

[[ ! -f /tmp/upgradable_packages ]] && ~/.local/bin/update_package_db

