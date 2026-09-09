<!-- Extends the secrets rule (`.agents/rules/secrets.md`). Adjust conventions to match the project. -->

# Version control

## Committing

- Only commit when the user asks, or when a workflow explicitly authorizes it.
  Never commit on your own initiative mid-task.
- Make **atomic** commits: one logical change per commit; don't bundle unrelated edits.
- Commit message style: <e.g. Conventional Commits — `feat: ...`, `fix: ...`, `docs: ...`>.
  - Subject in imperative mood, <= ~72 chars; body explains *why*, not *what*.
- Run format + lint + tests **before** committing (see Definition of done).

## Never do

- Never commit secrets, credentials, `.env` files, or PII. If one is staged, stop and warn.
- Never `git push --force` (or `--force-with-lease`) to a shared branch (`main`, `develop`, release branches).
- Never rewrite published history (`rebase`/`amend` on pushed commits) without explicit user approval.
- Never commit merge-conflict markers, commented-out debug code, or generated files that are gitignored.
- Never commit large binaries/build artifacts — respect `.gitignore`; add to it if missing.

## Branches & PRs

- Branch naming: <e.g. `feat/<short-desc>`, `fix/<ticket>`>.
- Keep branches focused and short-lived; rebase/merge per the project's stated strategy: <rebase | merge | squash>.
- PR description states: what changed, why, how verified, and any follow-ups (mirrors Definition of done).

## Destructive operations (ask first)

- `git reset --hard`, `git clean -fd`, branch deletion, tag deletion, history rewrites:
  confirm with the user and show what will be lost before running.
