#!/bin/bash

# Set the desired Java versions and their installation paths
java_versions=("11" "17")
java_installation_paths=("/opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk" "/opt/homebrew/opt/openjdk@17libexec/openjdk.jdk")

# Function to create symbolic links for each Java version
create_java_symlinks() {
    for ((i=0; i<${#java_versions[@]}; i++)); do
        version=${java_versions[i]}
        path=${java_installation_paths[i]}
        symlink_path="/Library/Java/JavaVirtualMachines/openjdk@$version"

        echo "Creating symbolic link for Java $version..."
        sudo ln -s "$path" "$symlink_path"

        # Verify the symbolic link
        if [ -L "$symlink_path" ]; then
            echo "Symbolic link for Java $version created successfully."
        else
            echo "Failed to create symbolic link for Java $version."
        fi
    done
}

# Main script execution
create_java_symlinks