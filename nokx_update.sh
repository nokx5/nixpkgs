#!/bin/bash

# git remote -v
# git remote add upstream https://github.com/NixOS/nixpkgs.git
# git remote -v

git fetch upstream
git checkout master
git merge upstream/master
git push origin master
