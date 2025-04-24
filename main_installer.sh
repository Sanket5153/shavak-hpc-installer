#!/bin/bash

echo "🔧 Welcome to the Shavak HPC App Setup Wizard"
echo "---------------------------------------------"
echo "Choose an option:"
echo "1. Check for essential system packages"
echo "2. Install missing system packages"
echo "3. Install HPC applications using Spack"
echo "4. Exit"
echo

read -p "Enter your choice [1-4]: " choice

case "$choice" in
    1)
        echo "🔍 Running package check..."
        bash 1.package_check.sh
        echo "📄 Log saved to package_check.log"
        ;;
    2)
        echo "📦 Installing missing packages..."
        bash 2.install_missing.sh
        ;;
    3)
        echo "🚀 Installing HPC apps using Spack..."
        bash 3.spack_installer.sh
        ;;
    4)
        echo "❎ Exiting..."
        exit 0
        ;;
    *)
        echo "❌ Invalid choice. Please run again and select a valid option."
        ;;
esac
