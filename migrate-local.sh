#!/bin/bash

echo "Migrating local repo at directory location [$1] to locally use 'main' instead of 'master' assuming the remote default branch name has been migrated"

# Important Variables
PREVIOUS_DEFAULT_BRANCH_NAME=master
NEW_DEFAULT_BRANCH_NAME=main

# Save current directory
CURRENT_DIR=$(pwd)
echo "Executing script from current directory: $CURRENT_DIR"

# Jump to the desired directory
cd $1

# Switch to the "master" branch:
$ git checkout $PREVIOUS_DEFAULT_BRANCH_NAME

# Rename it to "main":
$ git branch -m $PREVIOUS_DEFAULT_BRANCH_NAME $NEW_DEFAULT_BRANCH_NAME

# Get the latest commits (and branches!) from the remote:
$ git fetch

# Remove the existing tracking connection with "origin/master":
$ git branch --unset-upstream

# Create a new tracking connection with the new "origin/main" branch:
$ git branch -u origin/$NEW_DEFAULT_BRANCH_NAME

# Check the branch state for both local & remote branches
git status
git branch -a

# Jump back to the original current directory
echo "Returning back to the original current directory: $CURRENT_DIR"
cd $CURRENT_DIR
