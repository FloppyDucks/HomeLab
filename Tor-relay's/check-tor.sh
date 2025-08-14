#!/bin/bash

SESSION_NAME="tor_monitor"
PORT1=9102
PORT2=9107

# Start a new tmux session in detached mode
tmux new-session -d -s "$SESSION_NAME" -n "main"

# Split the window into two equal panes
tmux split-window -h -t "$SESSION_NAME:main"

# Send the commands to each pane
tmux send-keys -t "$SESSION_NAME:main.0" "sudo -u debian-tor nyx -i $PORT1" C-m
tmux send-keys -t "$SESSION_NAME:main.1" "sudo -u debian-tor nyx -i $PORT2" C-m

# Attach to the session for user interaction
tmux attach-session -t "$SESSION_NAME"

# After detaching or exiting tmux, kill any lingering tmux processes
pkill -9 tmux
