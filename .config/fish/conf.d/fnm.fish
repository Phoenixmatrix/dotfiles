if test -d "$HOME/.local/share/fnm"
    fish_add_path "$HOME/.local/share/fnm"
end

if type -q fnm
    fnm env --use-on-cd --shell fish | source
end
