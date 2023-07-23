# New Computer Setup Scripts
This repository contains the scripts to automatically setup a new computer (Macos, Linux and Windows).

# 1. Macos Installation

## 1.1. Pre-Installation

### Pre-requisites (Optional)
* Keyboard Layout
    * [Norman Layout](https://normanlayout.info/)
    * [Colemak Layout](https://colemak.com/)


### Create workspace directory

```
mkdir -p ~/workspace/Bluminds
```

## 1.1. Clone the Bluminds/devtool repository

```
cd ~/workspace/Bluminds
git clone https://github.com/Bluminds/devtool.git
```

## 1.2. Macos Software Installation
### 1.2.1. Initial Installation

Execute the following command to install initial dependencies.

```
cd ~/workspace/Bluminds/devtool
```

```
./devtool macos init
```
and follow the instructions.

**Note:** If the command *brew* is not recognized, verify you have the PATH variable well setup in the ***~/.bashrc*** or ***~/.zshrc*** file. It should include the following line:

```
export PATH=/opt/homebrew/bin:PATH
```

Re-open the *Terminal.app* or *iTerm2.app*.

***NOTE:*** After the installation, take a close look at the Errors and Warnings displayed in the screen. They might require additional configuration. 

### 1.2.2. Initial Software

Applications are grouped by category/type. Execute the following command to install/reinstall/uninstall the set of apps.

```
./devtool macos install system
./devtool macos install escentials
./devtool macos install network
./devtool macos install productivity
./devtool macos install development
./devtool macos install media
./devtool macos install games
./devtool macos install social
```