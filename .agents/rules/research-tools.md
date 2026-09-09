# Research tools

How to look things up when a task needs external knowledge. Tool-agnostic:
use whatever documentation lookup, MCP server, or search the project has wired
in — the policy below applies regardless of tool.

## When to research

- Only when it materially improves correctness — e.g. current APIs, exact
  config/syntax, recent advisories, release notes, or unfamiliar libraries.
- Don't research general concepts the model already knows, or this repo's own
  contents (read those files directly instead).

## Documentation lookup

- Prefer **official docs and primary sources**; fall back to reputable,
  widely-cited references.
- Pin the **library and version** you're targeting so results match the code.
- Fetch **minimal, targeted** material and summarize — no large dumps into context.
- If a docs MCP server (or similar) is configured, use it for library/API docs
  before general web search.

## Web search policy

- Enable and use web search only when it materially improves correctness.
- Record source dates (publish/release dates) when relevant.
- Cross-check anything security- or version-sensitive against a primary source.
