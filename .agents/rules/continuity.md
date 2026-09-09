# CONTINUITY.md workflow (REQUIRED)

Maintain a single continuity file for the current workspace:
`.agents/CONTINUITY.md` (see the template in `.agents/CONTINUITY.md.mysample`).

- It is a living, canonical briefing designed to survive compaction; do not
  rely on earlier chat/tool output unless it's reflected there.
- **At the start of each assistant turn: read `.agents/CONTINUITY.md` before acting.**

## File format

Update only when there is a meaningful delta in:

- `[PLANS]`: guide for the next contributor as much as checklists for you.
- `[DECISIONS]`: record all decisions made.
- `[PROGRESS]`: record course changes mid-implementation — why, and implications.
- `[DISCOVERIES]`: optimizer behavior, performance tradeoffs, unexpected bugs,
  inverse/unapply semantics — capture with short evidence (test output is ideal).
- `[OUTCOMES]`: at completion of a major task/plan — what was achieved, what
  remains, lessons learned.

## Anti-drift / anti-bloat rules

- Facts only. No transcripts, no raw logs.
- Every entry includes:
  - an ISO timestamp (e.g., `2026-01-13T09:42Z`),
  - a provenance tag: `[USER]`, `[CODE]`, `[TOOL]`, `[ASSUMPTION]`.
  - If unknown, write `UNCONFIRMED` (never guess). If something changes,
    supersede it explicitly — don't silently rewrite history.
- Keep the file bounded, short, high-signal.
- When a section bloats, compress older items into milestone (`[MILESTONE]`) bullets.
