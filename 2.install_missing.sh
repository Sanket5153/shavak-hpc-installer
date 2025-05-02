#!/bin/bash

LOGFILE="package_check.log"

if [ ! -f "$LOGFILE" ]; then
    echo "Log file $LOGFILE not found! Run the package check script first."
    exit 1
fi

# Detect package manager
if command -v apt &> /dev/null; then
    INSTALL_CMD="sudo apt install -y"
elif command -v dnf &> /dev/null; then
    INSTALL_CMD="sudo dnf install -y"
elif command -v yum &> /dev/null; then
    INSTALL_CMD="sudo yum install -y"
else
    echo "Supported package manager (apt/yum/dnf) not found."
    exit 1
fi

echo "Wiil install with this : $INSTALL_CMD"

# Extract missing packages from log
missing_pkgs=($(grep "not found" "$LOGFILE" | awk '{print $2}'))

if [ ${#missing_pkgs[@]} -eq 0 ]; then
    echo "No missing packages to install."
    exit 0
fi

echo "🔧 Installing missing packages: ${missing_pkgs[*]}"

for pkg in "${missing_pkgs[@]}"; do
    echo "Installing $pkg ..."
    $INSTALL_CMD "$pkg"
done

echo "Installation attempt completed."
