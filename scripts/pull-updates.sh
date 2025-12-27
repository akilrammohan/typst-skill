#!/bin/bash
#
# Pull latest updates to the typst-skill
# Run this periodically to keep your local skill up to date.
#
set -e

SKILL_DIR="$HOME/.claude/skills/typst-skill"

cd "$SKILL_DIR"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Checking for typst-skill updates..."

git fetch origin

LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)

if [ "$LOCAL" = "$REMOTE" ]; then
    echo "Already up to date."
else
    echo "Pulling latest changes..."
    git pull origin main
    echo "Updated successfully. Check CHANGELOG.md for what's new."
fi
