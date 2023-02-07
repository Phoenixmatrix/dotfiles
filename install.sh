# solve issue where github codespaces doesn't properly handle .config directory
ln -s ./.config/* $HOME/.config/

# fish directory will already exist
ln -s -f  ./config/fish/config.fish $HOME/.config/fish/config.fish
