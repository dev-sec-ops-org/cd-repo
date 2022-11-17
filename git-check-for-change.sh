#!/bin/sh

NOCOLOR='\033[0m'
ERROR='\033[0;31m'

# Get the Branch is checking
Branch=$(git rev-parse --abbrev-ref HEAD)
echo "You are working on $Branch branch."

if [ "$Branch" != "dev" ]
then
    echo ${ERROR}Not on dev. Aborting. # ${NOCOLOR}
    echo
    exit 0
fi

# Get the number of change, and git tag version reported by git
changeCount=$(git status --porcelain | wc -l)
tagVersion=$(git tag)
latesttagVersion=$(git describe --tags --abbrev=0)

if [ $changeCount == "0" ]; then
    echo "\nThere are no changed files."
    #exit 0
else
    echo "\nThere are $changeCount changed files."

    echo "\nTag Version is:"
    echo "$tagVersion"
    echo "Latest Tag version: $latesttagVersion"

fi

echo "\nDone!"
