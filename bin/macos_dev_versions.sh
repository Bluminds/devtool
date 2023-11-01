#!/bin/bash
# This script show the current versions of the  development tools in file ../lib/
# Path: bin/macos_dev_versions.sh

TOOLS=("java" "javac" "python" "go")

echo "+--------+---------+"
echo "| Tool   | Version |"
echo "+--------+---------+"

for tool in "${TOOLS[@]}"; do
    if [[ $tool == "java" || $tool == "javac" ]]; then
        version=$($tool -version 2>&1 | head -n 1 | awk -F '"' '{print $2}')
    elif [[ $tool == "go" ]]; then
        version=$($tool version 2>&1 | awk '{print $3}')
    else
        version=$($tool --version 2>&1 | head -n 1 | awk '{print $2}')
    fi
    printf "| %-6s | %-7s |\n" $tool $version
done

echo "+--------+---------+"
