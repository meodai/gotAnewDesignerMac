#!/usr/bin/env bash

# make sure your Apple ID was set as an argument
# if [ $# -eq 0 ]
#   then
#     echo "Make sure to call install.sh yourAppleId@whatever.com"
# fi

# # install homebrew
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

# # installs bundle Bundle
# brew tap Homebrew/bundle;
# # installs mas (App store repository)
# brew install mas;
# # signs MAS in with your apple store ID
# mas signin $1;

# # install apps and tool from Brewfile
# brew bundle;

# install chest for Sketch
gem install chest;

# install Sketch plugins from 'SketchPlugins' file
while read REPO
do
    chest install $REPO
    echo 'installing ' $REPO 'for Sketch';
done < SketchPlugins
