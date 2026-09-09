#!/bin/bash
# Usage: to-project.sh <target-repo>
#
#
set -euo pipefail

SRC="agentmd-scaffolding"

if [[ $# -ne 1 ]]; then
  echo "usage: $0 <target-repo>" >&2
  exit 1
fi

DEST="$1"

if [[ ! -d "$SRC" ]]; then
  echo "error: source '$SRC' not found (run from the agentmd repo root)" >&2
  exit 1
fi
if [[ ! -d "$DEST" ]]; then
  echo "error: target '$DEST' is not a directory" >&2
  exit 1
fi

# Copy every scaffold file, preserving structure and stripping `.scaffold`.
while IFS= read -r src; do
  rel="${src#"$SRC"/}"        # path relative to the scaffolding root
  rel="${rel%.scaffold}"      # strip the non-live suffix (if present)
  dst="$DEST/$rel"
  mkdir -p "$(dirname "$dst")"
  cp "$src" "$dst"
  echo "$src -> $dst"
done < <(find "$SRC" -type f | sort)

# Seed a continuity file if the project doesn't already have one.
cont="$DEST/.agents/CONTINUITY.md"
if [[ -e "$cont" ]]; then
  echo "kept existing $cont"
else
  mkdir -p "$(dirname "$cont")"
  cat > "$cont" <<'EOF'
# CONTINUITY

## [DECISIONS]

(none)

## [PLANS]

(none)

## [PROGRESS]

(none)

## [DISCOVERIES]

(none)

## [OUTCOMES]

(none)
EOF
  echo "created $cont"
fi
