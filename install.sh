#!/usr/bin/env bash

if [ $# -eq 0 ]
  then
    echo " Enter your AppleID followed by [ENTER]:"
    read APPLEID
else
    APPLEID=$1
fi

# install homebrew
if [[ ! "$(type -P brew)" ]]; then
    echo "🌶 Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

# Set the Application folder to the User
# export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

# installs bundle Bundle
brew tap Homebrew/bundle
brew install mas

echo "🍎 Signing in with your appleID"
mas signin $APPLEID

echo '❗ next time you are asked for you password, enter you system passowrd'
echo '❗ NOT the apple store password:'

# restore installed apps
brew bundle
echo '✅ Everything should be installed by now'
echo 'enjoy your freshly installed MAC '
