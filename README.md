# Typst Skill for Claude Code

A Claude Code skill for writing and creating Typst documents. Typst is a modern markup-based typesetting system and an alternative to LaTeX.

> Note from the maintainer: I barely know how to write Typst, but use it to make my resume more convenient to manage. Using LLMs to write Typst probably goes against the spirit of many members of the community, but if you just want to write quickly compiling documents that are easily modifiable (with Claude), this skill is for you! Also Claude wrote this entire thing itself, so use with caution, although I have not had any issues with it having incorrect info or anything.

## Important: 
This skill auto-updates weekly via a local cron job on my machine, and auto commits and pushes without making a PR for human review. It is set up this way because I wouldn't even know how to review a PR for this skill if Claude made one, so I'm just trusting Claude to make proper updates. If you trust Claude less than I do (which is likely if you are a Typst enthusiast), please actually read the skill and verify its correctness. You will also need to run a cron job to regularly pull, or just pull manually when you want. We have an update script in this repo for this purpose. If you are better versed in the skills ecosystem than I am (or have just done 5 minutes of research to see if there is a better way to auto-update skills than whatever this is), make a PR! Or fork it so the project no longer has anything to do with me! I do not care!

## Features

- Write Typst documents (.typ files) with proper syntax
- Convert LaTeX to Typst
- Create academic papers, reports, and documents
- Comprehensive math mode support
- Advanced templating and scripting patterns

## Installation

### Option 1: Clone directly (recommended)

```bash
git clone https://github.com/akilrammohan/typst-skill ~/.claude/skills/typst-skill
```

### Option 2: Manual installation

1. Create the skills directory if it doesn't exist:
   ```bash
   mkdir -p ~/.claude/skills/typst-skill
   ```

2. Copy the skill files:
   ```bash
   # Copy SKILL.md and references/ directory to ~/.claude/skills/typst-skill/
   ```

3. Restart Claude Code to load the skill.

4. Sanity check: ask Claude if it has a Typst skill.

## Usage

Once installed, Claude will automatically use this skill when you:

- Ask to create or edit `.typ` files
- Request Typst document formatting
- Want to convert LaTeX to Typst
- Need help with Typst syntax or math mode

Example prompts:
- "Create a Typst document for my research paper"
- "Convert this LaTeX equation to Typst"
- "Help me write a table in Typst"

## Contents

- `SKILL.md` - Main skill definition with essential Typst syntax
- `references/math.md` - Comprehensive math mode reference
- `references/advanced.md` - Advanced patterns, scripting, and templates
- `CHANGELOG.md` - Record of skill updates

## Staying Up to Date

This skill is actively maintained via an automated process: the maintainer runs a weekly cron job that uses Claude Code in headless mode to check the [Typst changelog](https://github.com/typst/typst/releases), review the documentation for new features or syntax changes, and update the skill files accordingly. All changes are logged in `CHANGELOG.md`.

To keep your local copy current, set up a weekly cron job to pull updates:

```bash
# Edit your crontab
crontab -e

# Pull updates weekly on Sundays at 10 AM
0 10 * * 0 ~/.claude/skills/typst-skill/scripts/pull-updates.sh >> /tmp/typst-skill-pull.log 2>&1
```

Or pull manually anytime:

```bash
~/.claude/skills/typst-skill/scripts/pull-updates.sh
```

## Requirements

- [Claude Code](https://claude.com/claude-code) CLI
- [Typst](https://typst.app/) installed for document compilation

## License

MIT License - see [LICENSE](LICENSE) for details.
