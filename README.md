# agentmd — modular agent configuration

A worked example of a **modular `AGENTS.md`**: one slim, always-loaded root file
that carries broad rules and *pointers*, with detail split into small files that
an agent reads on demand.

## Why modular?

`AGENTS.md` is injected into the agent's context on every turn. A short root
(~1–2 screens) keeps the important rules salient and cheap; deep detail lives in
`.agents/rules/*` and loads only when a task needs it.

## The `.scaffold` convention

Every file here ends in the **non-live suffix** `.scaffold` so agents don't
auto-apply it while we iterate in chat:

| Suffix       | Meaning                                             | To activate            |
| ------------ | --------------------------------------------------- | ---------------------- |
| `.scaffold`  | Template/scaffold to copy or rename                 | strip the suffix       |

Nothing is active until renamed. E.g. `AGENTS.md.scaffold` → `AGENTS.md`.

## Layout

```
AGENTS.md.scaffold                 # slim root: always-on rules + pointers
.agents/
  rules/
    secrets.md.scaffold
    autonomy-and-safety.md.scaffold
    research-tools.md.scaffold     # docs lookup + web search
    continuity.md.scaffold
    definition-of-done.md.scaffold
    version-control.md.scaffold
    ambiguity.md.scaffold
    lang/                          # per-language rules — see .agents/rules/lang/README.md
      _TEMPLATE.md.scaffold
      python.md.scaffold
  skills/
    source-document-review/        # example on-demand skill
```

## Activating everything

```bash
# root + rule files
mv AGENTS.md.scaffold AGENTS.md
for f in .agents/rules/*.md.scaffold; do mv "$f" "${f%.scaffold}"; done

# language rules you actually use (edit first!)
mv .agents/rules/lang/python.md.scaffold .agents/rules/lang/python.md

# skill
find .agents/skills -name '*.scaffold' -exec bash -c 'mv "$1" "${1%.scaffold}"' _ {} \;
```

> Two distribution patterns exist: **explicit pointers** (the root says "read file
> X before doing Y") work with any tool; **directory-scoped auto-merge** (a nested
> `AGENTS.md` deeper in the tree) is tool-dependent. This repo uses explicit
> pointers.

## Adding per-language rules

See [`.agents/rules/lang/README.md`](.agents/rules/lang/README.md).

## Gaps still open (not yet templated)

The ruleset covers safety, process, version control, ambiguity, and per-language
engineering. These recommended areas are **still missing** and would each make a
good new `.agents/rules/*.md`:

1. **In-code documentation standards** — docstring/comment expectations beyond
   "update docs" in Definition of done (partially covered per-language; no global rule).
2. **Logging & observability** — global stance on structured logging, log levels,
   and not swallowing errors (currently only mentioned per-language).
3. **Data privacy / PII** — handling personal data in code, logs, fixtures, and
   test data (secrets are covered; broader PII is not).
4. **Performance & resource budgets** — when to care about complexity, memory,
   query counts, N+1s; profiling before optimizing.
5. **Accessibility & i18n** — relevant if any UI is added (a11y, localization).
6. **Concurrency & state** — shared-state, race, and idempotency expectations.
7. **Review / handoff etiquette** — how the agent summarizes work and what a
   human reviewer should check.
8. **Environment & config** — env vars, config precedence, `.env.example`,
   local vs. CI vs. prod differences.
9. **CI/CD expectations** — which checks gate a merge; how to reproduce CI locally.
10. **Migration & data-change safety** — reversible migrations, backfills, and
    zero-downtime expectations.
