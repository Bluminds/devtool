# New Computer Setup Scripts
This repository contains the scripts to automatically setup a new computer (Macos and Windows).

# 1. Installation (Macos)

## 1.1. Macos Software Installation

0. Pre-requisites (Optional)
* [Norman Layout](https://normanlayout.info/)
* [Oh-my-zsh](https://ohmyz.sh/#install)

1. Install HomeBrew in your computer
   **Website:**  https://brew.sh/

    Open the Terminal app and execute the following command.

    ```
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

    Verify the installation was successful
    ```
    brew --version
    ```

    **Note:** If the command *brew* is not recognized, verify you have the PATH variable well setup in the ***~/.bashrc*** or ***~/.zshrc*** file. It should include the following line:
    ```
    export PATH=/opt/hoebrew/bin:PATH
    ```

2. Create the base directories

    ```
    mkdir -p ~/workspace
    cd ~/workspace
    ```

3. Clone this repository in Git
    ```
    git clone https://github.com/dicotips/init_setup
    ```

    If you do not have GIT installed, use:  ``` brew install git```

4. Run the following command to install the list of packages from  ```./macos/brew_packages.txt```

```
brew install $(cat ./macos/brew_packages.txt)
```

5. After the installation, take a close look at the Errors and Warnings displayed in the screen. They might require additional configuration. 