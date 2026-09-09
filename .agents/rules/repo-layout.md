<!-- Defines where the canonical repo layout lives and how to keep it current. -->

# Repository layout

Maintain a single canonical map of the repository at `.agents/REPO_LAYOUT.md`.
It is the authoritative reference for where things live so the agent can orient
without re-scanning the whole tree.

- **This file must be referenced from the root `AGENTS.md`** under "Detailed
  rules", e.g.: `- Repository layout → .agents/rules/repo-layout.md`.
- `AGENTS.md` should also point readers to the layout map itself:
  `- Repo layout map → .agents/REPO_LAYOUT.md`.

## What `.agents/REPO_LAYOUT.md` contains

- A top-level directory tree (one or two levels deep — not every file).
- One line per significant directory saying **what lives there and why**.
- Entry points (build, run, test) and where configuration lives.
- Where generated/vendored artifacts sit (so they're not hand-edited).
- Which language rules apply to which subtrees (link to `.agents/rules/lang/`).

## Rules

- Keep it high-signal and bounded — describe structure, not contents. No file
  dumps; regenerate the tree rather than hand-maintaining exhaustive lists.
- **Update it whenever the structure materially changes**: a new top-level
  directory, a moved/renamed module, or a new entry point. Stale layout is worse
  than none.
- **Keep `README.md` in sync**: when the layout changes, update any repository
  structure / project layout section in the root `README.md` to match
  `.agents/REPO_LAYOUT.md`. The two must not drift.
- Facts only; if a directory's purpose is unclear, mark it `UNCONFIRMED` rather
  than guessing (mirrors the continuity rule).
- Treat updating this file as part of the Definition of done when a change alters
  the layout.
