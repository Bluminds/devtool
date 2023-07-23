# settings.sh
#!/bin/bash

# Text styles
BOLD="\e[1m"
UNDERLINE="\e[4m"
BLINK="\e[5m"

# Foreground text colors
BLACK="\e[30m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
WHITE="\e[37m"

# Background colors
BG_BLACK="\e[40m"
BG_RED="\e[41m"
BG_GREEN="\e[42m"
BG_YELLOW="\e[43m"
BG_BLUE="\e[44m"
BG_MAGENTA="\e[45m"
BG_CYAN="\e[46m"
BG_WHITE="\e[47m"

# Reset color
RESET="\e[0m"
STATUS_FILE=".status"

# Funtion to print a text with collors BOLD and GREEN
function print() {
  echo -e "$BOLD$GREEN$1$RESET"
}

# Function to print a text with collors BOLD and RED
function print_error() {
  echo -e "$BOLD$RED$1$RESET"
}

# Function to print a text with collors BOLD and YELLOW

function print_warning() {
  echo -e "$BOLD$YELLOW$1$RESET"
}