#!/usr/bin/env bash

DOTPATH="$HOME/dotfiles"

if [ ! -e "$DOTPATH" ]; then
    echo "Error: Directory $DOTPATH does not exist."
    exit 1
fi

cd "$DOTPATH" || exit 1

for file in .??*; do
    [[ "$file" = ".git" ]] && continue
    [[ "$file" = ".DS_Store" ]] && continue
    [[ "$file" = ".travis.yml" ]] && continue
    ln -fhvs "$DOTPATH/$file" "$HOME/$file"
done

# [[ -z $XDG_CONFIG_HOME ]] && XDG_CONFIG_HOME=$HOME/.config
# mkdir -p "$XDG_CONFIG_HOME"

# ln -fhvs "$HOME/.vim" "$XDG_CONFIG_HOME/nvim"

# # kyrat
# mkdir -p "$XDG_CONFIG_HOME/kyrat"
# ln -fhvs "$HOME/.bashrc" "$XDG_CONFIG_HOME/kyrat/bashrc"
# ln -fhvs "$HOME/.inputrc" "$XDG_CONFIG_HOME/kyrat/inputrc"
# ln -fhvs "$HOME/.vimrc" "$XDG_CONFIG_HOME/kyrat/vimrc"
