# Default autonomy and safety

- Default to read-only exploration and analysis.
- When edits are needed, prefer **workspace-scoped** write access and keep
  changes inside the repo.
- For remote APIs, use **READ-only** calls unless the user explicitly instructs
  otherwise. If a WRITE is requested, perform it as a **dry-run first**. Never
  make destructive calls to remote APIs or production data sources.
