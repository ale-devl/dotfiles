#!/bin/zsh
cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

if type antidote >/dev/null 2>&1; then
    echo 'Antidote already installed'
else
    case $SYSTEM_PACKAGE_MANAGER in
    brew)
        brew install antidote;;
    *)
        echo 'Brew is not used and no alternative download method is implemented - Antidote will not be installed';;
    esac
fi

source /usr/local/opt/antidote/share/antidote/antidote.zsh

if type antidote >/dev/null 2>&1; then
    echo 'Installing zsh plugins using Antidote'
    antidote bundle < $DOTFILES_ROOT/antidote/plugins.txt > $DOTFILES_ROOT/antidote/zsh_plugins.zsh
else
    echo 'Error installing Antidote'
fi
