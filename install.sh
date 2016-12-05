#!/usr/bin/env bash

# Set the Application folder to the User
# export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

# Cosmic color sequence

ESC_SEQ="\x1b[38;5;"
COL_01=$ESC_SEQ"160;01m"
COL_02=$ESC_SEQ"196;01m"
COL_03=$ESC_SEQ"202;01m"
COL_04=$ESC_SEQ"208;01m"
COL_05=$ESC_SEQ"214;01m"
COL_06=$ESC_SEQ"220;01m"
COL_07=$ESC_SEQ"226;01m"
COL_08=$ESC_SEQ"190;01m"
COL_09=$ESC_SEQ"154;01m"
COL_10=$ESC_SEQ"118;01m"
COL_11=$ESC_SEQ"046;01m"
COL_12=$ESC_SEQ"047;01m"
COL_13=$ESC_SEQ"048;01m"
COL_14=$ESC_SEQ"049;01m"
COL_15=$ESC_SEQ"051;01m"
COL_16=$ESC_SEQ"039;01m"
COL_17=$ESC_SEQ"027;01m"
COL_18=$ESC_SEQ"021;01m"
COL_19=$ESC_SEQ"021;01m"
COL_20=$ESC_SEQ"057;01m"
COL_21=$ESC_SEQ"093;01m"
COL_22=$ESC_SEQ"093;01m"
RESET="\033[m"

printf "$COL_01                            ▄▄▄▓▓▓▓▓▓▓▓▓▓▓▄▄▄                         \n"
printf "$COL_02                          ▓▓▀▀  ▄▓▓▀▀▀▀▀▌▄▓▓▓▓▓▓▄                     \n"
printf "$COL_03                        ▓▓▀   ▄▓▓     ▄▓▓▀      ▓▓▓▄                  \n"
printf "$COL_04                        ▓▓    ▓▓     ▓▓▌     ▄▓▓▓▀▀▓▓▌                \n"
printf "$COL_05                         ▓▓▄▓▀▀▀▀▀▀▀▓▀▀▀▀▀▀▀▀▀▀▀▀▀▀█▓▓▓               \n"
printf "$COL_06                         ▓▓▀      ▓▓▀                ▓▓               \n"
printf "$COL_07                        ▓▓        ▓▌                 ▐▓▌              \n"
printf "$COL_08                       ▓▌        ▓▓                   ▓▓              \n"
printf "$COL_09                ▄▄▓▀▀▀▀▀▀▀▀▀▀▀▓▓▓▓▓▓▓▓▓▓▓█▀▀▀▀▀▀▀▀▀▀▀▀▓▓▓             \n"
printf "$COL_10                ▓▓    ▓▓       ▓▓▓     ▓▌              ▓▓▓▓▓▓▓▓▓▓▓▓▄  \n"
printf "$COL_11                ▓▓    ▓▌  ▓▓   ▓▓▓    ▐▓▌   ▓▓▄         ▓▓▓     ▓▓▓▓  \n"
printf "$COL_12                ▓▓   ▐▓  ▐▓▓  ▐▓▓▌    ▓▓    ▓▓▓         ▓▓▓     ▓▓▓▓  \n"
printf "$COL_13                ▐▓▄  ▓▓    ▀  ▓▓▓     ▓▓    ▓▓▓         ▐▓▓▌    ▓▓▓▓  \n"
printf "$COL_14                  ▀▓▓▓▓▄▄▄▄▄▓▓▓       ▓▓     ▀           ▓▓▌    █▀▀   \n"
printf "$COL_15                    ▓▓         ▓▓      ▓▓▄              ▄▓▓▌          \n"
printf "$COL_16             ▄      ▓▓         ▓▓        ▀▀█▓▓▄▄▄▄▄▄▄▄▓▓▓ ▓▓          \n"
printf "$COL_17             ▓▓▄    ▓▓         ▓▓▄▄▄▄▓▓▄                  ▓▄   ▄      \n"
printf "$COL_18               ▀▀▓▓▓▓▓                ▓▓                ▄▄▓▓▓▓▀       \n"
printf "$COL_19                   ▐▓▓▓▓▓▓▓▄▄▄▄▄▄    ▓▓        ▄▄▄▄▓▓▓▓▀▀▀ ▓▓         \n"
printf "$COL_20                   ▐▓       ▀▀▀▀▀▀▀▀▀▓▓▓▓▀▀▀▀▀▀▀▀          ▐▓         \n"
printf "$COL_21                   ▐▓▓              ▓▌                     ▐▓▌        \n"
printf "$COL_22                    ▀▀▀██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▄▄▄▄▄▄▄▄▄▓▓▓▓▓▓▓▓▓█▓█        \n"
printf "$RESET"



# checks if apple ID was used as argument, if not ask for it
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

# installs bundle Bundle
brew tap Homebrew/bundle
brew install mas

echo "🍎 Signing in with your appleID"
mas signin $APPLEID

echo "✅ Making sure you are using the latest node"
# installs n and the latest node version
brew install n
echo "❗ if promted for your password, enter your system password:"
sudo n latest

npm install
node index.js

echo '❗ The next time you are asked for your password, enter your system password'
echo '❗ NOT the apple store password:'

# restore installed apps
brew bundle
echo '✅ Everything should be installed by now'
echo 'enjoy your freshly installed Mac '
