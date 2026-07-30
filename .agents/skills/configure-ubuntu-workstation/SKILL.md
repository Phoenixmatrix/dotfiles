---
name: configure-ubuntu-workstation
description: Interactively configure an Ubuntu 26 GNOME developer workstation from this dotfiles repository. Use when rebuilding a Linux machine, applying or refreshing these portable dotfiles, installing the curated Fish, terminal, Git, runtime, Claude Code, Codex, Matrixfleet, or Codex Fleet setup, installing FiraCode Nerd Font, or producing follow-up authentication and secret-configuration instructions without storing secrets in Git.
---

# Configure Ubuntu Workstation

Rebuild the workstation in small, reviewable phases. Make hardware, username,
architecture, package availability, and existing-file decisions with the user
instead of replaying a monolithic installer.

## Start safely

1. Locate the repository root with Git; do not assume its absolute path.
2. Read [packages.md](references/packages.md) before installing anything.
3. Read [follow-up-template.md](references/follow-up-template.md) before the
   authentication phase.
4. Confirm the host is Ubuntu 26.x with GNOME and record `uname -m`. If it is a
   different release or desktop, stop and ask whether to adapt the workflow.
5. Inspect existing targets before writing. Offer merge, timestamped backup and
   replace, or skip. Never silently overwrite a non-symlink file.
6. Present the planned package and file changes, then obtain approval for each
   phase that uses `sudo`, downloads executables, changes the login shell, or
   replaces files.

Never read, print, request in chat, or commit secret values. Never copy auth
files, histories, caches, private keys, host keys, browser profiles, databases,
sessions, memories, `node_modules`, downloaded plugins, or generated hooks.

## Establish choices

Ask only questions that change the result:

- Confirm the Git author name and email.
- Ask whether stable dotfiles should be symlinked to this repository or copied.
  Recommend symlinks for hand-maintained files and copies or semantic merges for
  application-owned JSON/TOML.
- Ask whether to install Node.js, Rust, Go, Claude Code, Codex, Matrixfleet, and
  Codex Fleet now or defer them.
- Ask which installed GNOME terminal should use FiraCode Nerd Font.
- Ask before enabling model names, plugins, or MCP servers that the installed
  Claude Code or Codex build does not recognize.

## Install the portable toolset

Use the curated package groups and official fallbacks in `packages.md`. Prefer
Ubuntu 26 repositories. Do not add repositories or packages for WSL, Windows
interop, Wayland development, GPU drivers, Mesa builds, or hardware support.
Do not install jj, tmux, Neovim, SSH configuration, 1Password configuration,
Herdr, OpenCode, or Hermes.

Use pnpm for JavaScript package management. Do not invoke npm. Prefer official
standalone installers for tools such as Codex and Claude Code when available.
Verify downloaded release assets against the machine architecture and use a
temporary directory rather than keeping installers in the repository.

## Apply managed dotfiles

Handle each mapping separately:

| Repository path | Target | Treatment |
| --- | --- | --- |
| `.config/fish/config.fish` | `~/.config/fish/config.fish` | Symlink or copy |
| `.config/fish/fish_plugins` | `~/.config/fish/fish_plugins` | Symlink or copy, then run `fisher update` |
| `.config/fish/conf.d/fnm.fish` | `~/.config/fish/conf.d/fnm.fish` | Apply only when fnm is installed |
| `.config/starship.toml` | `~/.config/starship.toml` | Symlink or copy |
| `.config/zellij/config.kdl` | `~/.config/zellij/config.kdl` | Symlink or copy |
| `.dircolors` | `~/.dircolors` | Symlink or copy |
| `.gitconfig` | `~/.gitconfig` | Substitute the confirmed identity; merge or copy |
| `.config/git/ignore` | `~/.config/git/ignore` | Symlink or copy |
| `.config/gh/config.yml` | `~/.config/gh/config.yml` | Merge without touching `hosts.yml` |
| `.claude/CLAUDE.md` | `~/.claude/CLAUDE.md` | Merge or copy |
| `.claude/settings.json` | `~/.claude/settings.json` | Semantic JSON merge; never add hooks |
| `.codex/AGENTS.md` | `~/.codex/AGENTS.md` | Merge or copy |
| `.codex/config.toml` | `~/.codex/config.toml` | Semantic TOML merge; omit machine state |
| `.codex/rules/default.rules` | `~/.codex/rules/default.rules` | Merge or copy |
| `.codex/prompts/makerfirst.md` | `~/.codex/prompts/makerfirst.md` | Apply only when Makerfirst will be cloned |
| `.config/matrixfleet/policy.toml` | `~/.config/matrixfleet/policy.toml` | Apply only when Matrixfleet is installed |
| `.config/codex-fleet/config.json` | `~/.config/codex-fleet/config.json` | Apply only when Codex Fleet is installed |

Create parents as needed. Resolve all targets from `$HOME`; never substitute a
hard-coded username. Reject any candidate content containing `/mnt/c`, `.exe`,
`WSL`, `/root`, the previous username's home path, or a credential value.

## Configure Fish and terminal appearance

Install Fisher from its current official instructions and run `fisher update`
against the tracked `fish_plugins` file. Validate `fish -n` before offering to
change the login shell with `chsh`. Start a fresh login session before treating
the shell change as verified.

Install the latest FiraCode Nerd Font release into
`~/.local/share/fonts/FiraCodeNerdFont`, run `fc-cache -f`, and verify the
actual family name with `fc-list` and `fc-match`. Configure that family in the
user-selected GNOME terminal. Use `gsettings` only when its schema and profile
are discoverable; otherwise give exact GUI steps. Do not assume that GNOME
Terminal, Console, or Ptyxis is installed.

## Configure development and agent tools

When selected, install fnm and a current Node.js LTS, then install pnpm through
its standalone POSIX installer. Install Rust with rustup and Go from its
architecture-matched official archive only when requested.

Install Codex with OpenAI's current standalone Linux installer and let the user
perform interactive sign-in. Apply only documented keys supported by the
installed version; use `codex --strict-config` or `/debug-config` to find stale
keys. Install Claude Code with its current native Linux installer, then verify
with `claude doctor`. Do not restore the removed Herdr hooks.

Treat Claude plugins, Codex skills, Chrome DevTools MCP, Matrixfleet MCP, and
repository-backed skills as optional follow-up work. Do not copy their caches
or create broken symlinks before their source repositories exist.

## Generate the follow-up document

Always create `~/linux-setup-follow-up-YYYY-MM-DD.md` from the reference
template at the end of a run, even when setup succeeds. Set mode `0600`. Include
only relevant authentication commands, private-environment variable names,
deferred choices, failures, and verification gaps. Never include a secret value,
token, private key, auth-file content, or pasted login URL.

For private Fish variables, instruct the user to edit
`~/.config/fish/conf.d/private.fish` locally with mode `0600`. Do not create it
inside this repository and do not accept secret values through the agent chat.

## Verify and report

Verify the selected subset with the following checks where applicable:

- `fish -n ~/.config/fish/config.fish`
- a fresh Fish login and `type -a starship zoxide fzf bat fd zellij`
- `git config --global --list --show-origin`
- `zellij --version` and a clean test session
- `fc-match "FiraCode Nerd Font Mono"`
- `node --version`, `pnpm --version`, `rustc --version`, and `go version`
- `gh auth status`, without printing tokens
- `claude doctor`
- `codex --version` plus strict config diagnostics

Finish with completed, deferred, and failed sections and point to the generated
follow-up document. Do not call queued work complete and do not hide validation
limitations.
