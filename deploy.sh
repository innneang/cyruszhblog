#!/bin/bash
msg="rebuilding site `date`"
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Push source and build repos.

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

mv tags tag
# Add changes to git.
git add .

# Commit changes.
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push -f origin master

# Come Back up to the Project Root
cd ..