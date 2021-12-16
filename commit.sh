# Created by Declan Mullen
# Git repository can be found at: https://github.com/declancm/git-commit-kit

#!/bin/bash

if git rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(git rev-parse --abbrev-ref HEAD)
    gitDirectory=$(git rev-parse --show-toplevel)
    cd $gitDirectory
    remote=$(git remote)
    git add .
    wait
    git commit -a -m "auto commit @ `date -u +'%Y-%m-%d %H:%M:%S'`"
    wait
    git push $remote $branch
    cd -
else
    printf "You are not inside a git repository."
fi
