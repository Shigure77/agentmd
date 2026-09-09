# Secrets and sensitive data

- Never print secrets (tokens, private keys, credentials) to terminal output.
- Do not request that users paste secrets.
- Avoid commands that might expose secrets (e.g., broadly dumping env vars,
  `cat ~/.ssh/*`).
- Prefer existing authenticated CLIs; redact sensitive strings in any displayed
  output.
