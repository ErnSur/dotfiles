#!/bin/zsh

get_relative_path() {
    # both $1 and $2 are absolute paths beginning with /
    # returns relative path to $2/$target from $1/$source
    source=$1
    target=$2

    common_part=$source # for now
    result="" # for now

    while [[ "${target#$common_part}" == "${target}" ]]; do
        # no match, means that candidate common part is not correct
        # go up one level (reduce common part)
        common_part="$(dirname $common_part)"
        # and record that we went back, with correct / handling
        if [[ -z $result ]]; then
            result=".."
        else
            result="../$result"
        fi
    done

    if [[ $common_part == "/" ]]; then
        # special case for root (no common path)
        result="$result/"
    fi

    # since we now have identified the common part,
    # compute the non-common part
    forward_part="${target#$common_part}"

    # and now stick all parts together
    if [[ -n $result ]] && [[ -n $forward_part ]]; then
        result="$result$forward_part"
    elif [[ -n $forward_part ]]; then
        # extra slash removal
        result="${forward_part}"
    fi

    echo $result
}

get_abs_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

symlink() {
    # $1 path to original file
    # $2 symlink dir
    mkdir -p "$(dirname ${2})"
    ln -i -s -v "$(get_abs_filename ${1})" "${2}"
}

symlink_allFilesUnderDir() {
    # $1 path to dir containing original files
    # $2 symlink dir
    files=( $(find "${1}"* -type f) )
    for file in ${files[@]}; do
        #newPath="${2}/${${file}:2}"
        #echo "This: $file"
        relFilePath="$(get_relative_path ${1} ${file})"
        newPath="${2}/${relFilePath}"
        #echo $newPath
        symlink "${file}" "${newPath}"
    done
}

### Program

# Go to script dir
scriptDir=${0:a:h}
cd "${scriptDir}"

# Prepare folder for symlink export
rm -r ./export
mkdir "export"

# Export zprofile
symlink "./.zprofile" "./export/.zprofile"

# Export unity shortcuts
symlink "./unity/ES Shortcuts.shortcut" "./export/Library/Preferences/Unity/Editor-5.x/shortcuts/default/ES Shortcuts.shortcut"

# Export All files from .config
symlink_allFilesUnderDir "./.config/" "./export/.config/"

# sync export folder with home dir
rsync -a "./export/" "${HOME}/"
rm -r "./export"