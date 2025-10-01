#!/bin/bash

# Called with alias 'gitit'

pwd=$1

cd $pwd
git status
branch=$(git symbolic-ref --short HEAD) # gets branch in current dir

git add .

#message=" "
read -p 'git commit -m <message>: ' message
git commit -m "$message"

#read -p 'git push origin <branch>: ' branch
read -p "push to branch '$branch'? y/n " reply
if [ "$reply" == "y" ]; then
    echo "--------------------------------------"
    echo "--------->  Pushing to branch: $branch"
    echo "--------------------------------------"
    git push origin $branch 
else
    echo "!! Aborting push to $branch !!"
fi

echo "------------------------------------------"
echo "git status"
git status



