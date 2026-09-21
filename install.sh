#!/usr/bin/env bash
# Install or update the dev team.
# Prefer the plugin (see README); use this to pin a copy into one project.
#   bash install.sh <project-root> <owner.md>   -> <project-root>/.claude/  (commit it; private repos only)
#   bash install.sh ~ <owner.md>                -> ~/.claude/               (local sessions)
# The owner profile defaults to ~/.claude/owner.md if not given.
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
TARGET="$(cd "${1:?usage: bash install.sh <project-root | ~> [owner.md]}" && pwd)"
OWNER="${2:-$HOME/.claude/owner.md}"

AGENTS="data-seneschal product-owner senior-lead data-architect qa-tester scout ops-steward"
SKILLS="devteam interview principles idea protocol google-workspace-automation"

[ "$SRC" = "$TARGET" ] && { echo "Target is the team repo itself; nothing to install."; exit 0; }

mkdir -p "$TARGET/.claude/agents" "$TARGET/.claude/skills"
for a in $AGENTS; do cp "$SRC/agents/$a.md" "$TARGET/.claude/agents/"; done
for s in $SKILLS; do rm -rf "$TARGET/.claude/skills/$s"; cp -R "$SRC/skills/$s" "$TARGET/.claude/skills/"; done

# Owner profile holds personal details: copy it unless it already is the target file.
if [ -f "$OWNER" ]; then
  [ "$(cd "$(dirname "$OWNER")" && pwd)/$(basename "$OWNER")" = "$TARGET/.claude/owner.md" ] || cp "$OWNER" "$TARGET/.claude/owner.md"
else
  echo "WARNING: no owner profile at $OWNER. Copy owner.example.md, fill it in, and re-run." >&2
fi

git -C "$SRC" rev-parse --short HEAD 2>/dev/null > "$TARGET/.claude/devteam-version" || echo unknown > "$TARGET/.claude/devteam-version"

# Agent drafts never get committed.
if [ -d "$TARGET/.git" ] && ! grep -qx '.devteam/drafts/' "$TARGET/.gitignore" 2>/dev/null; then
  printf '\n.devteam/drafts/\n' >> "$TARGET/.gitignore"
fi

echo "Installed devteam $(cat "$TARGET/.claude/devteam-version") into $TARGET/.claude"
echo "Only commit .claude/owner.md to PRIVATE repos. Start a new session to register the team."
