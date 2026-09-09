# Per-language rules (`.agents/rules/lang/`)

Language-specific rules the agent reads **only** when editing files in that
language. This keeps language detail out of the always-loaded root `AGENTS.md`.

## How it works

1. The root `AGENTS.md` lists a pointer per language, e.g.
   `- Python code → .agents/rules/lang/python.md`.
2. When a task touches Python, the agent reads `python.md` and follows those
   rules **in addition to** the root always-on rules (300-LOC cap, fail-fast,
   no empty try/catch, qualify dependencies).
3. Per-language files should *reference* the root rules, not restate them.

## Adding a new language

```bash
# 1. copy the template
cp _TEMPLATE.md.scaffold <language>.md        # e.g. typescript.md, go.md, rust.md

# 2. fill every <PLACEHOLDER>, delete rows that don't apply
# 3. add a pointer in the root AGENTS.md under "Per-language rules"
# 4. (this folder) rename any .scaffold you want active: strip the suffix
```

`python.md.scaffold` is a fully filled example — read it alongside the template.

## What each language file MUST fill in

These are the gaps the template exists to close. When authoring a language rule,
**none of these should be left as a placeholder**:

| # | Section        | What must be filled                                                                 |
| - | -------------- | ----------------------------------------------------------------------------------- |
| 1 | Scope          | Path globs the rules apply to; toolchain version; package manager                   |
| 2 | Commands       | Install, build, run, **test-all**, **test-single**, lint, format, typecheck         |
| 3 | Authoritative formatter | Which formatter is canonical (agent must run it, not hand-format)          |
| 4 | Style          | Naming conventions; file/module layout; where lint/format config lives              |
| 5 | Doc comments   | Which in-code doc style (docstrings / JSDoc / godoc) and what needs documenting     |
| 6 | Errors         | The error idiom (exceptions / error returns / Result) — must honor root fail-fast   |
| 7 | Logging        | Which logger; structured logging; no print-debugging; no secrets/PII in logs        |
| 8 | Testing        | Framework; test location/pattern; "new code ships with tests"; no skip/xfail to pass |
| 9 | Dependencies   | Add-dep command; lockfile to commit; pinning; license/maintenance bar               |
| 10| Generated files | Which files must **not** be hand-edited (lockfiles, `dist/`, codegen, migrations)  |
| 11| Gotchas        | Language traps an agent commonly gets wrong (async, nullability, ownership, etc.)   |

If a row genuinely doesn't apply (e.g. "Build" for an interpreted language),
mark it `N/A` rather than leaving a `<PLACEHOLDER>`.

## Files here

| File                      | Purpose                                  |
| ------------------------- | ---------------------------------------- |
| `_TEMPLATE.md.scaffold`   | Copy this to start a new language rule   |
| `python.md.scaffold`      | Filled example (Python + uv + ruff)      |
| `markdown.md.scaffold`    | Filled example (Markdown + prettier + markdownlint) |
