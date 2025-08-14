#!/bin/bash
SESSION_NAME="tor_monitor"

# Only pick files whose name contains 'torrc'
TORRC_FILES=(/etc/torrc.d/*/*torrc*)

# Filter out non-regular files just in case
TORRC_FILES=($(for f in "${TORRC_FILES[@]}"; do [[ -f "$f" ]] && echo "$f"; done))

# Must have at least 2 torrc files
if [[ ${#TORRC_FILES[@]} -lt 2 ]]; then
    echo "Error: Less than 2 torrc files found under /etc/torrc.d/*/*"
    exit 1
fi

# Pick the first two torrc files
TORRC1=${TORRC_FILES[0]}
TORRC2=${TORRC_FILES[1]}

# Extract the last active ControlPort from each torrc
CONTROL1=$(grep -i '^[[:space:]]*ControlPort' "$TORRC1" | grep -vE '^\s*#' | tail -n1 | awk '{print $2}')
CONTROL2=$(grep -i '^[[:space:]]*ControlPort' "$TORRC2" | grep -vE '^\s*#' | tail -n1 | awk '{print $2}')

if [[ -z "$CONTROL1" ]]; then
    echo "Error: Could not find ControlPort in $TORRC1"
    exit 1
fi
if [[ -z "$CONTROL2" ]]; then
    echo "Error: Could not find ControlPort in $TORRC2"
    exit 1
fi

echo "Left pane ControlPort: $CONTROL1"
echo "Right pane ControlPort: $CONTROL2"

# Kill existing tmux session if it exists
if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    tmux kill-session -t "$SESSION_NAME"
fi

# Start a new detached tmux session
tmux new-session -d -s "$SESSION_NAME" -n "main"

# Left pane: Nyx for first Tor node
tmux send-keys -t "$SESSION_NAME:main.0" "sudo -u debian-tor nyx -i $CONTROL1" C-m

# Right pane: split horizontally and Nyx for second Tor node
tmux split-window -h -t "$SESSION_NAME:main"
tmux send-keys -t "$SESSION_NAME:main.1" "sudo -u debian-tor nyx -i $CONTROL2" C-m

# Set even-horizontal layout
tmux select-layout -t "$SESSION_NAME" even-horizontal

# Attach to the session for user interaction
tmux attach-session -t "$SESSION_NAME"

# After detaching or exiting tmux, kill the session to clean up
tmux kill-session -t "$SESSION_NAME"

