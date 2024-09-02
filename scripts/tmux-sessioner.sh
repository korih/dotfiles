#!/bin/bash

# From the https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer
if [[ $# -eq 1 ]]; then
    selected=$(find ~/.config/ ~/Programming/School/agrobot/ ~/Programming/School/ ~/Programming/Projects/ -mindepth 1 -maxdepth 1 -type d | fzf)

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
else
    echo "need name for session"
fi

