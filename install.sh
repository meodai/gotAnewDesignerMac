#!/usr/bin/env bash

if [ $# -eq 0 ]
  then
    echo "❗ Make sure to call install.sh yourAppleId@whatever.com"
fi

# install homebrew
if [[ ! "$(type -P brew)" ]]; then
    echo "🌶 Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

# installs bundle Bundle
brew tap Homebrew/bundle
brew install mas

echo "🍎 Signing in with your appleID"
mas signin $1

echo '❗ next time you are asked for you password, enter you system passowrd'
echo '❗ NOT the apple store password:'

# restore installed apps
brew bundle
echo '✅ Everything should be installed by now';
