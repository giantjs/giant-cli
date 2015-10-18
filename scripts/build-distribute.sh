#!/usr/bin/env bash
set -e

##
# Builds & distributes the module specified in $1
##

if [[ $(giant run $1 "ls *.tgz 2> /dev/null | grep tgz") ]]; then
    giant run $1 "npm install *.tgz && npm prune"
fi

if [[ $(giant run $1 "npm ls --depth=0 2> /dev/null | grep grunt") ]]; then
    ## calling grunt with params passed to build-distribute
    giant run $1 "grunt build ${@:2}"
fi

giant run $1 "npm pack"

giant run $1 "echo ../*/ | xargs -n 1 cp *.tgz"
