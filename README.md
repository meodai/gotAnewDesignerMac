#  gotAnewDesignerMac
Automatically installs all the Apps a designer needs on your brand new Mac

## 💾 Download [here](https://github.com/meodai/gotAnewDesignerMac/archive/master.zip)
get the files you need [here](https://github.com/meodai/gotAnewDesignerMac/archive/master.zip) and extract them

## 💻 Installation
- Open `Brewfile` with TextEdit and make sure to comment out all the Apps you don't want
- Open Terminal app.
- Type `CD ` (with a space) and drag the `gotAnewDesingerMac` folder to the Terminal app.
- Hit [ENTER ↵].
- Type: `. install.sh` (don't forget the `.` before install) followed by [ENTER ↵].
- Follow the instructions in the terminal. **You will by prompted for your appleID and your system password later**

## 📂 Alternative `Applications` folder location
If you prefer to have your apps in `/YourUser/Applications`, open `install.sh` with TextEdit
and uncomment the line `export HOMEBREW_CASK_OPTS="--appdir=~/Applications"`.
