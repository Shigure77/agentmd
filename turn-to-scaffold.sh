#!/bin/bash
set -euo pipefail

DEST="agentmd-scaffolding"

# Files that are specific to THIS repo, not part of the reusable scaffold.
EXCLUDE=(
  ".agents/CONTINUITY.md"
  ".agents/rules/project-goal.md"
)

is_excluded() {
  local f="$1"
  for e in "${EXCLUDE[@]}"; do
    [[ "$f" == "$e" ]] && return 0
  done
  return 1
}

# Relevant source files: the root AGENTS.md plus the whole .agents/ tree.
mapfile -t FILES < <(printf '%s\n' "AGENTS.md"; find .agents -type f | sort)

# Start clean so removed files don't linger in the scaffold.
rm -rf "$DEST/AGENTS.md.scaffold" "$DEST/.agents"

for src in "${FILES[@]}"; do
  is_excluded "$src" && continue

  # Decide the destination name.
  case "$src" in
    *.scaffold)          rel="$src" ;;           # already a scaffold file
    */README.md|README.md) rel="$src" ;;         # README stays live/readable
    *)                   rel="$src.scaffold" ;;  # append the non-live suffix
  esac

  dst="$DEST/$rel"
  mkdir -p "$(dirname "$dst")"
  cp "$src" "$dst"
  echo "$src -> $dst"
done
