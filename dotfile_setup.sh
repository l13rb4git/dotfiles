#!/bin/bash

dotfiles=(".vimrc" ".zshrc" ".gitconfig")
dir="${HOME}/Documents/dotfiles"

for dotfile in "${dotfiles[@]}";
do
 ln -sf "${dir}" "${HOME}/${dotfile}"
done
