#!/usr/bin/env bash

if [ $# -eq 0 ]
  then
    echo "Make sure to call install.sh yourAppleId@whatever.com"
fi

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

# installs bundle Bundle
brew tap Homebrew/bundle;
brew install mas;

mas signin $1;

# restore installed apps
brew bundle;
