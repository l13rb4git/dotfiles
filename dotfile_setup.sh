#!/bin/bash

dotfiles=(".vimrc" ".vim" ".zshrc" ".tmux.conf")
dir="${HOME}/Documents/dotfiles"

for dotfile in "${dotfiles[@]}";
do
 cp -lrf "${dir}/${dotfile}" "${HOME}/${dotfile}"
done
