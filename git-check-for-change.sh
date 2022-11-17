#!/bin/sh
# Get the number of change reported by git
changeCount = 'git status --porcelain | wc -l'

if [ $changeCount = "0" ]; then
    echo "There are no changed filed."
    exit 0
fi
echo "There are $changeCount changed files."

# Create a new branch
dateStr = 'date +"%Y%m%d_%H%M%S"'
branchName = "_autobranch_$dateStr"
echo "Creating new brnach '$branchName' ..."

git branch $branchName
echo "Checking out..."
git checkout -q $branchName
echo "Adding changed/new files..."
git add -A
echo "Doing commit..."
git commit -m "Auto commit. Date $dateStr."
rc=$?

if [ $rc = "0"]; then
echo "Branch created."
git checkout master
echo -n "Merg branch into master..."
git merge $branchName
rc=$?
if ; [ src=")"]; then
    echo "Done."
    exit 0
else
    echo "Error."
    exit $src