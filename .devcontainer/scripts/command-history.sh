#!/usr/bin/env bash

set -e

USERNAME=${1:-"node"}

COMMAND_HISTORY_LOCATION="/commandhistory/"

if [ "$USERNAME" = "root" ]; then
  USER_LOCATION="/root"
else
  USER_LOCATION="/home/$USERNAME"
fi

BASH_CONFIG="$USER_LOCATION/.bashrc"
ZSH_CONFIG="$USER_LOCATION/.zshrc"

create_command_history_location() {
  if ! [ -d "$COMMAND_HISTORY_LOCATION" ]; then
    mkdir -p "$COMMAND_HISTORY_LOCATION"
  fi

  touch "$COMMAND_HISTORY_LOCATION/.bash_history"
  touch "$COMMAND_HISTORY_LOCATION/.zsh_history"

  chown -R $USERNAME $COMMAND_HISTORY_LOCATION
}

config_bash() {
  echo "Configuring BASH..."

  # create configuration file if not exists
  if ! [ -f "$BASH_CONFIG" ]; then
    mkdir -p "$(dirname "$BASH_CONFIG")" && touch "$BASH_CONFIG"
  fi

  # add history file location to bash config
  SNIPPET="export HISTFILE=$COMMAND_HISTORY_LOCATION/.bash_history "
  echo "$SNIPPET" >> "$BASH_CONFIG"
}

config_zsh() {
  # check if zsh is installed
  if ! type zsh >/dev/null 2>&1; then
    echo "ZSH is not installed. Skipping..."
    return
  fi

  echo "Configuring ZSH..."

  # create configuration file if not exists
  if ! [ -f "$ZSH_CONFIG" ]; then
    mkdir -p "$(dirname "$ZSH_CONFIG")" && touch "$ZSH_CONFIG"
  fi

  # add history file location to zsh config
  SNIPPET="export HISTFILE=$COMMAND_HISTORY_LOCATION/.zsh_history "
  echo "$SNIPPET" >> "$ZSH_CONFIG"
}

echo "Configuring command history persistence for user: $USERNAME"

create_command_history_location
config_zsh
config_bash
