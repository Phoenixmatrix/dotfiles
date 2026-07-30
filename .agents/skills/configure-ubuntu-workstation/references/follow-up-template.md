# Ubuntu workstation follow-up

Generated: `YYYY-MM-DD`

This file must contain instructions and variable names only. Never write secret
values, tokens, private keys, auth-file contents, or temporary login URLs here.

## Authentication still requiring user interaction

- GitHub: run `gh auth login`, then `gh auth setup-git`, and verify with
  `gh auth status`.
- Codex: run `codex` and complete the offered interactive sign-in flow.
- Claude Code: run `claude` and complete the offered interactive sign-in flow.

Remove any item that is not installed or was already verified.

## Private shell variables

If private environment variables are still required, create the local file
outside the repository:

```sh
install -d -m 700 "$HOME/.config/fish/conf.d"
touch "$HOME/.config/fish/conf.d/private.fish"
chmod 600 "$HOME/.config/fish/conf.d/private.fish"
${EDITOR:-nvim} "$HOME/.config/fish/conf.d/private.fish"
```

Document required variable names, such as `CF_ACCESS_CLIENT_ID` and
`CF_ACCESS_CLIENT_SECRET`, but enter their values only in the local editor.
Prefer project-scoped credentials when global shell variables are unnecessary.

## Deferred choices

- Replace this line with explicitly deferred tools, configurations, or repository
  clones. If none remain, write `None`.

## Verification gaps or failures

- Replace this line with checks that could not be completed and their safe retry
  commands. If none remain, write `None`.

## Session restart

Record whether a logout, terminal restart, or reboot is needed for the login
shell, font selection, group membership, or desktop settings to take effect.
