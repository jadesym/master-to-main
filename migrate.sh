#!/bin/bash

echo "Migrating repo at local directory location [$1] to use 'main' instead of 'master' as the default branch name"

# Important Variables
PREVIOUS_DEFAULT_BRANCH_NAME=master
NEW_DEFAULT_BRANCH_NAME=main

# Save current directory
CURRENT_DIR=$(pwd)
echo "Executing script from current directory: $CURRENT_DIR"

# Jump to the desired directory
cd $1

git branch -m master $NEW_DEFAULT_BRANCH_NAME
git status
git push -u origin $NEW_DEFAULT_BRANCH_NAME

# Modifying the Github default branch name.
# This is necessary in order to delete the previous default branch name
gh repo edit --default-branch $NEW_DEFAULT_BRANCH_NAME

git push origin --delete $PREVIOUS_DEFAULT_BRANCH_NAME

# Check the branch state for both local & remote branches
git status
git branch -a

# Jump back to the original current directory
echo "Returning back to the original current directory: $CURRENT_DIR"
cd $CURRENT_DIR
