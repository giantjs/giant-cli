#!/usr/bin/env bash
set -e

##
# Builds & distributes the module specified in $1
##

if [[ $(giant run $1 "ls *.tgz 2> /dev/null | grep tgz") ]]; then
    if [[ $(giant run $1 "ls giant-deps.dat 2> /dev/null | grep giant-deps.dat") ]]; then
        giant run $1 "cat giant-deps.dat | xargs npm install"
    else
        giant run $1 "npm install *.tgz"
    fi
fi

giant run $1 "npm prune"

if [[ $(giant run $1 "npm ls --depth=0 2> /dev/null | grep grunt") ]]; then
    ## calling grunt with params passed to build-distribute
    giant run $1 "grunt build ${@:2}"
fi

giant run $1 "npm pack"

## using rsync instead of cp as rsync doesn't fail on src / dest being the same
giant run $1 "echo ../*/ | xargs -n 1 rsync *.tgz"
