# solve issue where github codespaces doesn't properly handle .config directory
ln -s $PWD/.config/* $HOME/.config/

# fish directory will already exist
ln -s -f $PWD/config/fish/config.fish $HOME/.config/fish/config.fish
