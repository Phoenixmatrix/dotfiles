# Ubuntu 26 package and application baseline

Use this as a curated baseline, not a frozen lockfile. Recheck official sources
and `apt-cache policy` at execution time. Commands and source links were
verified on 2026-07-30.

## Core APT packages

Install only selected groups after showing them to the user.

Shell and terminal:

```text
fish fzf starship
```

Portable Unix and development utilities:

```text
ca-certificates curl git gh bat fd-find ripgrep jq unzip xz-utils fontconfig
neovim less file tree zstd
```

Build prerequisites, only when a selected tool needs them:

```text
build-essential pkg-config libssl-dev
```

After installing Ubuntu's `bat` and `fd-find`, check whether `bat` and `fd`
exist. If Ubuntu provides only `batcat` or `fdfind`, create user-local symlinks
in `~/.local/bin` or rely on the guarded Fish aliases. Do not overwrite existing
binaries.

Prefer Neovim over Vim. When requested, add a guarded Fish alias so `vim`
invokes `nvim`, and verify both names resolve without installing Vim separately.

Do not install WSL packages, Windows interoperability tools, graphics stacks,
Wayland or X11 development packages, Mesa build dependencies, GPU drivers, or
hardware support from this workflow.

## Fish plugins

Install Fisher from its official repository, then apply the tracked plugin
list with `fisher update`:

```fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
fisher install jorgebucaran/fisher
fisher update
```

Source: https://github.com/jorgebucaran/fisher

## User-level terminal tools

- Zoxide: prefer its official installer because its maintainers warn that
  Debian and Ubuntu packages can lag.
  Source: https://github.com/ajeetdsouza/zoxide
- Zellij: prefer an official release binary matching `uname -m`; if Rust and
  `cargo-binstall` are already selected, `cargo binstall zellij` is acceptable.
  Source: https://zellij.dev/documentation/installation.html
- Git Delta: use an official architecture-matched release package when Ubuntu
  does not provide `git-delta`.
  Source: https://github.com/dandavison/delta
- Git Town: use its official architecture-matched Debian package or installer.
  Source: https://www.git-town.com/install.html

Do not compile these from source merely to reproduce the workstation.

## FiraCode Nerd Font

Download only the `FiraCode.tar.xz` asset from the latest Nerd Fonts release,
extract the font files into `~/.local/share/fonts/FiraCodeNerdFont`, and run
`fc-cache -f`. Do not clone the Nerd Fonts repository.

Source: https://github.com/ryanoasis/nerd-fonts/releases/latest

## Node.js and pnpm

Install fnm only when requested:

```text
https://github.com/Schniz/fnm
```

Use its Fish integration from the tracked `conf.d/fnm.fish`, install a current
Node.js LTS, and set that LTS as the fnm default. Install pnpm with the official
standalone POSIX installer so npm is never required:

```sh
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

Source: https://pnpm.io/installation

## Optional language toolchains

- Rust: use rustup from https://rustup.rs and install only the selected default
  toolchain. Do not use Ubuntu's `cargo` package as a second installation.
- Go: use the architecture-matched official archive and current instructions
  from https://go.dev/doc/install. Do not copy the previous machine's Go tree.

## Agent tools

- Codex: use the current standalone Linux installer documented at
  https://learn.chatgpt.com/docs/codex/cli. Do not install it globally with npm.
- Claude Code: prefer the current native Linux installer documented at
  https://docs.anthropic.com/en/docs/claude-code/getting-started and verify with
  `claude doctor`. If only a JavaScript package method remains available, use
  pnpm rather than npm.
- Matrixfleet and Codex Fleet: build or install from their cloned source
  repositories after confirming the repository locations. Never copy binaries,
  state databases, sockets, worktrees, or generated hooks from the old machine.

Offer to restore these portable Codex skill capabilities after their current
sources are available; do not copy the installed skill directories themselves:

- Cloudflare, Agents SDK, Durable Objects, Workers best practices, Wrangler,
  Cloudflare Email Service, Cloudflare One, Cloudflare One migrations, Sandbox
  SDK, Turnstile Spin, and web performance skills from Cloudflare's current
  official skills distribution.
- Matrixfleet from the cloned Matrixfleet repository.
- DoorDash CLI only after its source or supported installer is available.

For Claude Code, restore the official `frontend-design` and
`rust-analyzer-lsp` plugins only after the installed Claude build confirms that
they remain available. Treat plugin enablement in `settings.json` as preference,
not proof of installation.

Authentication belongs in the follow-up phase, not in commands recorded in Git.
