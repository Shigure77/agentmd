<!-- Extends the "think ahead" always-on rule. -->

# Handling ambiguity (ask vs. proceed)

Goal: avoid both extremes — guessing silently, and stalling on trivial questions.

## Ask the user first when

- The request is **destructive or irreversible** (deleting data, force-push, prod writes, dropping tables).
- There are **multiple materially different interpretations** and the wrong one wastes significant work.
- It requires a **new dependency**, external service, or architectural decision (per root "don't reinvent the wheel").
- **Requirements/acceptance criteria are missing** and can't be inferred from the codebase or docs.
- It touches **security, privacy, secrets, cost, or compliance**.

## Proceed (state your assumption) when

- The ambiguity is **low-risk and reversible**, and a reasonable default exists.
- Existing code, tests, docs, or `.agents/CONTINUITY.md` already imply the answer.
- Asking would clearly cost more than a quick, easily-corrected attempt.

In this case: pick the most likely interpretation, **label it as an assumption**,
record it in `.agents/CONTINUITY.md` with an `[ASSUMPTION]` tag, and continue.

## How to ask

- Batch related questions into one message; don't drip-feed.
- Offer concrete options with a recommended default, e.g. "A (recommended) / B / C".
- Never guess at facts you can verify — read the code/docs first, ask only what's truly unknown.
- If blocked on an answer, say what you *can* do meanwhile.
