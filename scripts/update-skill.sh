#!/bin/bash
#
# Typst Skill Auto-Update Script
# Runs Claude Code in headless mode to check for Typst updates and update the skill accordingly.
#
set -e

SKILL_DIR="$HOME/.claude/skills/typst-skill"
LOG_FILE="$SKILL_DIR/scripts/update.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "Starting typst-skill update check..."

cd "$SKILL_DIR"

# Run Claude Code in headless mode
claude -p "You are maintaining a Typst skill for Claude Code. Your task:

1. Fetch the Typst changelog from https://github.com/typst/typst/releases to check for recent updates
2. Read the current skill files to understand what's documented:
   - SKILL.md (core syntax reference)
   - references/math.md (math mode reference)
   - references/advanced.md (advanced patterns)
3. Compare the changelog against our skill documentation to identify any new features, syntax changes, or deprecations that should be reflected

If updates are needed:
1. Update the relevant skill file(s) with the new information
2. Append a new dated entry to CHANGELOG.md summarizing what changed (use format: ## [Update] - YYYY-MM-DD)
3. Run: git add -A && git commit -m 'chore: update skill for Typst changes' && git push

If no updates are needed (skill is already up to date), do nothing and report that no changes were necessary.

Be conservative - only update if there are genuine new features or breaking changes that users need to know about." \
  --allowedTools "Read,Edit,Write,Bash(git:*),WebFetch" \
  --max-turns 15

log "Update check completed."
