#!/bin/bash

# Called with alias 'gitpull'

pwd=$1

cd $pwd
git status

branch=$(git symbolic-ref --short HEAD)

read -p 'git pull from main? y/n (n will pull from local branch): ' reply

git config pull.rebase false

if [[$reply == 'y']]; then
    git pull origin main
elif [[$reply == 'n']]; then 
    git pull origin $branch
else
    echo 'invalid, exiting'
fi 

git status



