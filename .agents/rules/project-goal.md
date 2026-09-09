# Project goal (read first for context)

Context, not a checklist — so an agent knows what this project is before acting.

**agentmd** is a worked example of a **modular `AGENTS.md`**: one slim,
always-loaded root of broad rules + *pointers*, with detail split into small
`.agents/rules/*` files read on demand. The repo *is* the deliverable — reusable
agent-config scaffolding meant to be copied into other projects.

## What "good" looks like

- Keep the root slim: new detail becomes a small rule file + a pointer, never
  more root text.
- Rules wired via **explicit pointers** ("read file X before doing Y") — works
  with any tool; no tool-dependent auto-merge.
- Distributed files end in `.scaffold` so nothing auto-applies until renamed.
- Rule files stay tight and reference the root rules instead of restating them.
- Keep changes reusable — don't hard-code anything specific to one downstream repo.

## Where to look

- Root rules & pointers → `AGENTS.md`
- Per-language rules → `.agents/rules/lang/` (see its `README.md`)
- Authoring a new rule → `.agents/rules/_TEMPLATE.md.scaffold`
- Distributable copy → `agentmd-scaffolding/`
