#!/bin/zsh
cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

if type antidote >/dev/null 2>&1; then
    echo 'Antidote already installed'
else
    brew install antidote
fi

source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh

if type antidote >/dev/null 2>&1; then
    echo 'Installing zsh plugins using Antidote'
    antidote bundle < $DOTFILES_ROOT/antidote/plugins.txt > $DOTFILES_ROOT/antidote/zsh_plugins.zsh
else
    echo 'Error installing Antidote'
fi
