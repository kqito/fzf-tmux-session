#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTS_DIR="$CURRENT_DIR/scripts"

is_fzf-tmux_excutable() {
  if type fzf-tmux >/dev/null 2>&1; then
    echo "fzf-tmux"
  fi
}

get_tmux_option() {
  local option=$1
  local default_value=$2
  local option_value=$(tmux show-option -gqv "$option")
  if [ -z $option_value ]; then
    echo $default_value
  else
    echo $option_value
  fi
}

bind_key() {
  local custom_key=$1
  local default_key=$2
  local key_bindings=$(get_tmux_option "$custom_key" "$default_key")
	local key

	for key in $key_bindings; do
    tmux bind-key "$key" run-shell -b "$SCRIPTS_DIR/fzf_tmux_session"
	done
}

readonly cmd="$(is_fzf-tmux_excutable)"

# delay with sleep to compensate for tmux starting time
sleep 1

if [ -z cmd ]; then
  tmux display-message "Failed to load fzf-tmux-session: fzf-tmux command was not found on the PATH"
else
  bind_key "@fzf-tmux-session-key" "a"
fi
