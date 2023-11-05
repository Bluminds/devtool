# devtool

---
**Table of Contents**

- [devtool](#devtool)
- [1. Macos Installation](#1-macos-installation)
  - [1.1. Pre-Installation](#11-pre-installation)
    - [Pre-requisites (Optional)](#pre-requisites-optional)
    - [Create workspace directory](#create-workspace-directory)
  - [1.2. Clone the Bluminds/devtool repository](#12-clone-the-blumindsdevtool-repository)
  - [1.3. Macos Software Installation](#13-macos-software-installation)
    - [1.3.1. Initial Installation](#131-initial-installation)
    - [1.3.2. Make devtool available everywhere (Optional)](#132-make-devtool-available-everywhere-optional)
    - [1.3.3. Macos application installation](#133-macos-application-installation)
- [2. Ubuntu Installation](#2-ubuntu-installation)
  - [2.1. Pre-Installation](#21-pre-installation)
    - [Pre-requisites (Mandatory)](#pre-requisites-mandatory)
    - [Create workspace directory](#create-workspace-directory-1)
  - [2.2. Clone the Bluminds/devtool repository](#22-clone-the-blumindsdevtool-repository)
  - [1.3. Ubuntu Software Installation](#13-ubuntu-software-installation)
    - [1.3.1. Initial Installation](#131-initial-installation-1)
    - [2.3.2. Make devtool available everywhere](#232-make-devtool-available-everywhere)
    - [2.3.3. Ubuntu application installation](#233-ubuntu-application-installation)
---

This repository contains the scripts to automatically setup a new computer (Macos, Ubuntu and Windows).

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

## 1.2. Clone the Bluminds/devtool repository

```
cd ~/workspace/Bluminds
git clone https://github.com/Bluminds/devtool.git
```

## 1.3. Macos Software Installation
### 1.3.1. Initial Installation

Execute the following command to install initial dependencies.

```
cd ~/workspace/Bluminds/devtool
```

```
./devtool macos init
```
and follow the instructions.

**Note:** If the command *brew* is not recognized, verify you have the PATH variable well set in the ***~/.bashrc*** or ***~/.zshrc*** file. It should include the following line:

```
export PATH=/opt/homebrew/bin:$PATH
```

Re-open the *Terminal.app* or *iTerm2.app*.

***NOTE:*** After the installation, take a close look at the Errors and Warnings displayed on the screen. They might require additional configuration. ***~/.zshrc*** or

### 1.3.2. Make devtool available everywhere (Optional)
Add to the file ***~/.bashrc*** or ***~/.zshrc*** the following exports.

```
# Bluminds Devtool
export DEVTOOL=$HOME/workspace/Bluminds/devtool
export PATH=$DEVTOOL:$PATH
```

### 1.3.3. Macos application installation

```
devtool macos install system
devtool macos install essentials
devtool macos install network
devtool macos install productivity
devtool macos install development
devtool macos install media
devtool macos install social
devtool macos install games
devtool macos install graphics
```

For application versions
```
devtool macos versions development
devtool macos versions all
```

# 2. Ubuntu Installation

## 2.1. Pre-Installation

### Pre-requisites (Mandatory)

* Updated packages: ```sudo apt update && sudo apt upgrade```
* Install Git: ```sudo apt install git ```

### Create workspace directory

```
mkdir -p ~/workspace/Bluminds
```

## 2.2. Clone the Bluminds/devtool repository

```
cd ~/workspace/Bluminds
git clone https://github.com/Bluminds/devtool.git
```

## 1.3. Ubuntu Software Installation
### 1.3.1. Initial Installation

Execute the following command to install initial dependencies.

```
cd ~/workspace/Bluminds/devtool
```

```
./devtool ubuntu init
```
and follow the instructions.

```
export PATH=/opt/homebrew/bin:$PATH
```

Re-open the *Terminal.app*.

***NOTE:*** After the installation, take a close look at the Errors and Warnings displayed on the screen. They might require additional configuration. ***~/.zshrc*** or


### 2.3.2. Make devtool available everywhere
Add to the file ***~/.bashrc*** or ***~/.zshrc*** the following exports

```
# Bluminds Devtool
export DEVTOOL=$HOME/workspace/Bluminds/devtool
export PATH=$DEVTOOL:$PATH
```

### 2.3.3. Ubuntu application installation

```
devtool ubuntu install system
devtool ubuntu install essentials
devtool ubuntu install network
devtool ubuntu install productivity
devtool ubuntu install development
devtool ubuntu install media
devtool ubuntu install social
devtool ubuntu install games
devtool ubuntu install graphics
```

For application versions
```
devtool ubuntu versions development
devtool ubuntu versions all
```