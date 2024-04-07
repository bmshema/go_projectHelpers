#!/bin/bash
#
# Creates a new Cobra CLI Go project layout and opens it in VSCode.

# Source the configuration
if [ -f "./config.env" ]; then
    source ./config.env
else
    echo "Configuration file not found. Please run setup_config.sh first."
    exit 1
fi

# Function to display help menu
show_help() {
    echo "Usage: $0 -n NAME [-d DOMAIN]"
    echo ""
    echo "Options:"
    echo "  -d DOMAIN    The project repo domain. (If different than what was set globally)"
    echo "  -n NAME      The project name. This option is required."
    echo ""
    echo "Example:"
    echo "  $0 -n mycliapp"
    echo "  $0 -n mycliapp -d mydomain.com"
}

# Check if no options were provided
if [ $# -eq 0 ]; then
    show_help
    exit 1
fi

# Flag to check if NAME is provided
NAME_PROVIDED=false

# CLI options
while getopts "d:n:" flag; do
    case "${flag}" in
        d) DOMAIN=${OPTARG};; # Project repo domain
        n) NAME=${OPTARG}; NAME_PROVIDED=true;; # Project name is required
        *) show_help
           exit 1 ;;
    esac
done

# Check if NAME was provided
if ! $NAME_PROVIDED; then
    echo "Error: Project name (-n) is required."
    show_help
    exit 1
fi

# Create and navigate to the project folder
mkdir -p "$WORKDIR/$NAME" && cd "$WORKDIR/$NAME" || exit

# Initialize the project
go mod init "$DOMAIN/$NAME"

# create the repository structure
mkdir -p cmd/$NAME
mkdir -p pkg/$NAME

touch cmd/$NAME/root.go
touch pkg/$NAME/$NAME.go
touch main.go

# add Cobra as a dependency
go get -u github.com/spf13/cobra@latest

# open project in VSCode
code .