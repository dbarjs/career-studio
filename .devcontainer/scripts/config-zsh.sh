#!/usr/bin/env bash

set -e

USERNAME=${1:-"node"}

echo "Configuring ZSH for user: $USERNAME"

# Checks if packages are installed and installs them if not
check_packages() {
	if ! dpkg -s "$@" >/dev/null 2>&1; then
		if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
			echo "Running apt-get update..."
			apt-get update -y
		fi
		apt-get -y install --no-install-recommends "$@"
	fi
}

check_packages git ca-certificates

# ensure zsh is installed
if ! type zsh >/dev/null 2>&1; then
    check_packages zsh
fi 

if [ "$USERNAME" = "root" ]; then
  USER_LOCATION="/root"
else
  USER_LOCATION="/home/$USERNAME"
fi

# ensure oh-my-zsh installed
if ! [ -d $USER_LOCATION/.oh-my-zsh ]; then
  echo "Installing oh-my-zsh..."
  check_packages wget
  sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

ZSH_CONFIG="$USER_LOCATION/.zshrc"
OMZSH_PLUGINS_LOCATION="$USER_LOCATION/.oh-my-zsh/custom/plugins"
OMZSH_THEMES_LOCATION="$USER_LOCATION/.oh-my-zsh/custom/themes"

# create configuration file if not exists
if ! [ -f "$ZSH_CONFIG" ]; then
  mkdir -p "$(dirname "$ZSH_CONFIG")" && touch "$ZSH_CONFIG"
fi 

currdir=$(pwd)

# Install plugins
# https://github.com/antfu/dotfiles/blob/main/.zshrc

echo "Installing ZSH plugins..."

mkdir -p "$OMZSH_PLUGINS_LOCATION"
cd "$OMZSH_PLUGINS_LOCATION" || exit

git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone --depth 1 https://github.com/agkozak/zsh-z

sed -i -e "s/plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-z)/g" "$ZSH_CONFIG"

# Install spaceship theme
# https://spaceship-prompt.sh/getting-started/#Installing

echo "Installing ZSH theme..."

mkdir -p "$OMZSH_THEMES_LOCATION"
cd "$OMZSH_THEMES_LOCATION" || exit

git clone --depth 1 https://github.com/spaceship-prompt/spaceship-prompt.git
ln -s "spaceship-prompt/spaceship.zsh-theme" "spaceship.zsh-theme"

sed -i '/^ZSH_THEME/c\ZSH_THEME="spaceship"' "$ZSH_CONFIG"
