#!/usr/bin/env bash

# WARNNING: THIS SCRIPT ONLY FOR CRONTASK
# DO NOT RUN NOMARLLY
# CYCLE: 0 0 */2 * *
# once tow days

# author: undermoodzyx

# change working directory to home dir
cd ~

# file list to update in home dir
files=(
    .zshrc
    .minttyrc
    .tmux.conf
)

# token for checking whether need to git process
declare need_git

# check this script self first


for file in $files; do

    # if file had been changed
    if [ ~/$file -nt ~/dotfiles/$file ]; then
        # cp to git repo
        cp $file ~/dotfiles/$file
        need_git=1
    fi
done

if [[ $need_git ]]; then
    # enter git repo
    cd ~/dotfiles
    git add .
    git commit -m "update at $(date +%Y%m%d__%X)"
    # git push origin master
fi
