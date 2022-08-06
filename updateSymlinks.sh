#!/bin/zsh

get_abs_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

# cd to dotfiles root

rm -r ./export
mkdir "export"
files=( $(find ./.config/* -type f) )
for file in ${files[@]}; do
    newPath="./export/${${file}:2}"
    mkdir -p "$(dirname ${newPath})"
    echo "From: ${file}"
    echo "To: ${newPath}"
    ln -s "$(get_abs_filename ${file})" "${newPath}"
done

ln -s "$(get_abs_filename ./.zprofile)" "./export/.zprofile"

rsync -a "./export/" "~/"
rm -r "./export"