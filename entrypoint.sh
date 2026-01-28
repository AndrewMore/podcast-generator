#!/bin/bash
set -e

echo "====================="

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

python /usr/bin/feed.py

git add -A

# Don't fail the action if nothing changed
git commit -m "Update Feed" || echo "Nothing to commit"

git push --set-upstream origin main

echo "====================="
