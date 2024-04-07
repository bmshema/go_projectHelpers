#!/bin/bash

# Default values
default_domain="example.com/"
default_workdir="/home/username/repos/"

print_color() {
    echo -e "\033[$1m$2\033[0m"
}

color_electric_blue="0;94"
color_yellow="0;33"

# Read user input
print_color $color_electric_blue "Enter your repo domain [$default_domain]: "
read -p "" user_domain
print_color $color_electric_blue "Enter your work directory [$default_workdir]: "
read -p "" user_workdir

# Use default if no input is given
repo_domain="${user_domain:-$default_domain}"
workdir="${user_workdir:-$default_workdir}"

echo "DOMAIN=$repo_domain" > config.env
echo "WORKDIR=$workdir" >> config.env

print_color $color_yellow "Configuration saved. You can now run the project setup scripts."