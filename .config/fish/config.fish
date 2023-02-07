if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path ~/.local/bin

starship init fish | source
zoxide init fish | source

# nvm support using bass
function nvm
    bass source $NVM_DIR/nvm.sh --no-use ';'nvm $argv'
end
