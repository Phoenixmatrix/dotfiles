set -g fish_greeting

set -gx EDITOR nvim
set -gx VISUAL nvim

fish_add_path "$HOME/.local/bin"
set -gx SSH_AUTH_SOCK "$HOME/.1password/agent.sock"
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/go/bin"

set -gx PNPM_HOME "$HOME/.local/share/pnpm"
fish_add_path "$PNPM_HOME/bin"

if test -d "$HOME/.bun/bin"
    fish_add_path "$HOME/.bun/bin"
end

if status is-interactive
    if type -q starship
        starship init fish | source
    end

    if type -q zoxide
        zoxide init fish | source
    end

    if functions -q fzf_configure_bindings
        # Use fzf.fish's defaults, but keep Ctrl-v available for normal use.
        fzf_configure_bindings --variables=ctrl-alt-v
    else if type -q fzf
        fzf --fish | source
    end

    if type -q zellij
        zellij setup --generate-completion fish | source
    end

    # Ubuntu may expose these binaries under conflict-free names.
    if not type -q bat; and type -q batcat
        alias bat=batcat
    end

    if not type -q fd; and type -q fdfind
        alias fd=fdfind
    end

    if type -q nvim
        alias vim=nvim
    end
end
