# 🍎 gotAnewDesignerMac
Automatically installs all the Apps a designer needs on his brand new MAC

## 💾 Download
- get the files you need [here](https://github.com/meodai/gotAnewDesignerMac/archive/master.zip) and extract them

## 💻 Installation
- Open `Brewfile` with TextEdit and make sure to comment out all the Apps you don't want
- Open Terminal app.
- type `CD ` (with a space) and drag the `gotAnewDesingerMac` folder to the Tarminal app
- hit enter
- type: `. install.sh yourAppStoreId@whatever.com` (don't forget the `.` before install)


## 💻 Alternative `Applications` folder location
If you prefer to have your apps in `/YourUser/Applications open `install.sh` with a textedit
and uncomment the line `export HOMEBREW_CASK_OPTS="--appdir=~/Applications"`.


