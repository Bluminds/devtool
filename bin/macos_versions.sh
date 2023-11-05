#!/bin/bash

# Check if a file name has been provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_name>|all"
    exit 1
fi

# File to check (provided as a command-line argument)
file_name="$1"

if [ "$file_name" == "all" ]; then
    echo 
    echo "###################################################################################################################"
    echo "#### RUST (Cargo) >> cargo install --list"
    cargo install --list

    echo
    echo "###################################################################################################################"
    echo "#### nvm (Node versions) >> nvm list"
    source $NVM_DIR/nvm.sh
    nvm list

    echo
    echo "###################################################################################################################"
    echo "#### npm (Node Modules) >> npm list -g"
    npm list -g

    echo
    echo "###################################################################################################################"
    echo "#### devtool development >> devtool macos versions development"
    file_name="development"
fi

# Base directory where the app list is located in DEVTOOL env variable
base_dir="$DEVTOOL/lib/macos/brew/"

# Define padding for each column
app_pad=25
version_pad=20

# Temporary file for storing unsorted output
temp_file=$(mktemp /tmp/app_versions.XXXXXX)

# Function to check for app installation and version for both formulae and casks
check_app_version() {
    local app=$1
    local installed_version=""

    # Check if the app is installed and get the version
    installed_info=$(brew list --versions "$app" 2>/dev/null)
    if [[ $? -eq 0 ]]; then
        installed_version=$(echo "$installed_info" | awk '{print $NF}')
    else
        # Check for casks
        installed_info=$(brew list --cask --versions "$app" 2>/dev/null)
        if [[ $? -eq 0 ]]; then
            installed_version=$(echo "$installed_info" | awk '{print $NF}')
        else
            installed_version="Not installed"
        fi
    fi

    # Output the result to the temp file
    printf "| %-${app_pad}s | %-${version_pad}s |\n" "$app" "$installed_version" >> "$temp_file"
}

# Construct the full file path
file_path="$base_dir$file_name"

# Check if the provided file path exists
if [ ! -f "$file_path" ]; then
    echo "Error: The file '$file_path' does not exist."
    exit 1
fi

# Calculate total number of lines (for progress bar)
total_lines=$(wc -l < "$file_path")
current_line=0

# Read the file and check each app
while IFS= read -r app; do
    # Update progress
    let "current_line++"
    let "progress=(current_line*100/total_lines)"
    
    # Skip empty lines and comments
    [[ "$app" == \#* ]] || [[ -z "$app" ]] && continue
    
    # Show progress bar
    printf "\rChecking applications... %3d%%" "$progress"

    # Check the app's installation and version
    check_app_version "$app"
done < "$file_path"

# Move to a new line after progress bar completion
echo ""

# Print the table header
printf "| %-${app_pad}s | %-${version_pad}s |\n" "Application" "Installed Version"
printf "|=%-${app_pad}s=|=%-${version_pad}s=|\n" | tr ' ' '='

# Sort the temp file and output the sorted information
sort "$temp_file" | cat -

# Clean up the temporary file
rm "$temp_file"
