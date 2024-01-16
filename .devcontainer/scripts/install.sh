#!/usr/bin/env bash

set -e

USERNAME=${1:-"node"}

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

# List of scripts to run
scripts=("config-zsh.sh" "command-history.sh")

echo "Running scripts for user: $USERNAME"

echo "$@"
e

# Loop through the scripts and run them
for script in "${scripts[@]}"
do
  if [ -f "$(dirname $0)/$script" ]; then
    echo "Running $script"
    /bin/bash "$(dirname $0)/$script" "$@"
  else
    echo "Error: Cannot find script $script"
  fi
done
