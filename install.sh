# start by symlinking the top level stuff
for f in ./.*
do
  if [[ -f $file ]]; then
    ln -s $PWD/$file $HOME/$file;
  fi
done

# solve issue where github codespaces doesn't properly handle .config directory
ln -s $PWD/.config/* $HOME/.config/

# fish directory will already exist
ln -s -f $PWD/.config/fish/config.fish $HOME/.config/fish/config.fish
