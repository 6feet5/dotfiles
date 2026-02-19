#!/usr/bin/env bash
# Quickly select session based on what folders are found and selected. A new tmux instance is started
# if this is run outside tmux, and if run within tmux it will switch session in current instance.
#
# Inspired by ThePrimeagens tmux-sessionizer

# Which folder to look in
DIRS=(
    "$HOME/.config"
    "$HOME/work"
    "$HOME/projects"
    "$HOME"
)

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(fd . "${DIRS[@]}" --type=dir --max-depth=1 --full-path --base-directory $HOME \
        | sed "s|^$HOME/||" \
        | fzf --tmux --color="dark")

    [[ $selected ]] && selected="$HOME/$selected"
fi

[[ ! $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t "$selected_name" 2>/dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected"
    tmux select-window -t "$selected_name:1"
fi

if [[ -z $TMUX ]]; then
    tmux attach -t $selected_name
else
    tmux switch-client -t $selected_name
fi

