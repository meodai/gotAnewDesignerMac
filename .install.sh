#!/usr/bin/env bash
cd .

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# installs bundle Bundle
brew tap Homebrew/bundle

# restore installed apps
brew bundle
