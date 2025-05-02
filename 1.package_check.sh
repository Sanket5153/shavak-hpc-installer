#!/bin/bash

# Log file
LOGFILE="package_check.log"
> "$LOGFILE"  # Clear previous log

# List of essential packages
required_packages=(
    gcc g++ gfortran
    make cmake autoconf automake libtool m4
    git wget curl rsync
    tar gzip bzip2 xz unzip zip
    python3 pip
    patch perl pkg-config file sudo
)

# Arrays to track found and not found
found=()
not_found=()

echo "----- Checking essential packages for Spack -----" | tee -a "$LOGFILE"
echo "" | tee -a "$LOGFILE"

for pkg in "${required_packages[@]}"; do
    sleep 1
    if command -v "$pkg" &> /dev/null; then
        echo "$pkg found" | tee -a "$LOGFILE"
        found+=("$pkg")
    else
        echo "$pkg not found" | tee -a "$LOGFILE"
        not_found+=("$pkg")
    fi
done

# Final summary
echo -e "\n----- Summary -----" | tee -a "$LOGFILE"

if [ ${#found[@]} -gt 0 ]; then
    echo "Found packages: ${found[*]}" | tee -a "$LOGFILE"
fi

if [ ${#not_found[@]} -gt 0 ]; then
    echo "Missing packages: ${not_found[*]}" | tee -a "$LOGFILE"
    echo "Please install the missing packages for smooth operation of Spack." | tee -a "$LOGFILE"
fi
