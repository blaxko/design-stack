#!/usr/bin/env bash
# Design Stack installer for macOS / Linux / WSL. Usage: bash install.sh
set -e
SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.claude/marketplaces/design-stack"
mkdir -p "$DEST" && cp -R "$SRC/.claude-plugin" "$SRC/plugins" "$DEST/"
if command -v claude >/dev/null; then
  claude plugin marketplace remove design-stack >/dev/null 2>&1 || true
  claude plugin marketplace add "$DEST"
  claude plugin install design-stack@design-stack
  claude plugin install checklist-design@design-stack
  echo "Installed. Check with: claude plugin list"
else
  echo "No 'claude' CLI on PATH. In a Claude Code session, type:"
  echo "  /plugin marketplace add $DEST"
  echo "  /plugin install design-stack@design-stack"
  echo "  /plugin install checklist-design@design-stack"
fi
echo "Next: run /mcp and log in to 'untitledui' if you have PRO. Try: /design-stack:design-stack build a signup + onboarding flow"
