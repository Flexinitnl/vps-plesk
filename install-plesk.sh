#!/bin/bash

# Prompt user for installation options
echo "Select the installation options:"
echo "1. Install Plesk complete"
echo "2. Select installation options"
echo "3. Back"
read -p "Enter your choice (1-3): " choice

# Execute installation based on user's choice
case $choice in
    1)
        echo "Executing Plesk installation"
        if command -v curl &> /dev/null; then
            sh <(curl -fsSL https://autoinstall.plesk.com/one-click-installer)
        elif command -v wget &> /dev/null; then
            sh <(wget -qO- https://autoinstall.plesk.com/one-click-installer)
        else
            echo "Error: Neither curl nor wget is installed."
            exit 1
        fi
        ;;
    2)
        while true; do
            echo "Select the installation options:"
            echo "1. Plesk with Apache modules"
            echo "2. Plesk with MySQL configuration"
            echo "3. Plesk with Apache modules and MySQL configuration"
            echo "4. Install Apache modules only"
            echo "5. Install MySQL configuration only"
            echo "6. Back"
            read -p "Enter your choice (1-6): " sub_choice

            case $sub_choice in
                1)
                    echo "Executing Plesk installation"
                    if command -v curl &> /dev/null; then
                        sh <(curl -fsSL https://autoinstall.plesk.com/one-click-installer)
                    elif command -v wget &> /dev/null; then
                        sh <(wget -qO- https://autoinstall.plesk.com/one-click-installer)
                    else
                        echo "Error: Neither curl nor wget is installed."
                        exit 1
                    fi
                    echo "Installing Apache modules"
                    if command -v curl &> /dev/null; then
                        curl -fsSL https://raw.githubusercontent.com/Flexinitnl/vps-plesk/main/scripts/apache-modules.sh | bash
                    elif command -v wget &> /dev/null; then
                        wget -qO- https://raw.githubusercontent.com/Flexinitnl/vps-plesk/main/scripts/apache-modules.sh | bash
                    else
                        echo "Error: Neither curl nor wget is installed."
                        exit 1
                    fi
                    echo "Apache modules installed"
                    ;;
                2)
                    echo "Executing Plesk installation"
                    if command -v curl &> /dev/null; then
                        sh <(curl -fsSL https://autoinstall.plesk.com/one-click-installer)
                    elif command -v wget &> /dev/null; then
                        sh <(wget -qO- https://autoinstall.plesk.com/one-click-installer)
                    else
                        echo "Error: Neither curl nor wget is installed."
                        exit 1
                    fi
                    echo "Configuring MySQL"
                    if command -v curl &> /dev/null; then
                        curl -fsSL https://raw.githubusercontent.com/Flexinitnl/vps-plesk/main/scripts/configure-mysql.sh | bash
                    elif command -v wget &> /dev/null; then
                        wget -qO- https://raw.githubusercontent.com/Flexinitnl/vps-plesk/main/scripts/configure-mysql.sh | bash
                    else
                        echo "Error: Neither curl nor wget is installed."
                        exit 1
                    fi
                    echo "MySQL Configuration Completed"
                    ;;
                3)
                    echo "Executing Plesk installation"
                    if command -v curl &> /dev/null; then
                        sh <(curl -fsSL https://autoinstall.plesk.com/one-click-installer)
                    elif command -v wget &> /dev/null; then
                        sh <(wget -qO- https://autoinstall.plesk.com/one-click-installer)
                    else
                        echo "Error: Neither curl nor wget is installed."
                        exit 1
                    fi
                    echo "Installing Apache modules"
                    if command -v curl &> /dev/null; then
                        curl -fsSL https://raw.githubusercontent.com/Flexinitnl/vps-plesk/main/scripts/apache-modules.sh | bash
                    elif command -v wget &> /dev/null; then
                        wget -qO- https://raw.githubusercontent.com/Flexinitnl/vps-plesk/main/scripts/apache-modules.sh | bash
                    else
                        echo "Error: Neither curl nor wget is installed."
                        exit 1
                    fi
                    echo "Apache modules installed"
                    echo "Configuring MySQL"
                    if command -v curl &> /dev/null; then
                        curl -fsSL https://raw.githubusercontent.com/Flexinitnl/vps-plesk/main/scripts/configure-mysql.sh | bash
                    elif command -v wget &> /dev/null; then
                        wget -qO- https://raw.githubusercontent.com/Flexinitnl/vps-plesk/main/scripts/configure-mysql.sh | bash
                    else
                        echo "Error: Neither curl nor wget is installed."
                        exit 1
                    fi
                    echo "MySQL Configuration Completed"
                    ;;
                4)
                    echo "Installing Apache modules only"
                    if command -v curl &> /dev/null; then
                        curl -fsSL https://raw.githubusercontent.com/Flexinitnl/vps-plesk/main/scripts/apache-modules.sh | bash
                    elif command -v wget &> /dev/null; then
                        wget -qO- https://raw.githubusercontent.com/Flexinitnl/vps-plesk/main/scripts/apache-modules.sh | bash
                    else
                        echo "Error: Neither curl nor wget is installed."
                        exit 1
                    fi
                    echo "Apache modules installed"
                    ;;
                5)
                    echo "Installing MySQL configuration only"
                    if command -v curl &> /dev/null; then
                        curl -fsSL https://raw.githubusercontent.com/Flexinitnl/vps-plesk/main/scripts/configure-mysql.sh | bash
                    elif command -v wget &> /dev/null; then
                        wget -qO- https://raw.githubusercontent.com/Flexinitnl/vps-plesk/main/scripts/configure-mysql.sh | bash
                    else
                        echo "Error: Neither curl nor wget is installed."
                        exit 1
                    fi
                    echo "MySQL Configuration Completed"
                    ;;
                6)
                    break
                    ;;
                *)
                    echo "Invalid choice. Please try again."
                    ;;
            esac
        done
        ;;
    3)
        echo "Back"
        ;;
    *)
        echo "Invalid choice. Exiting..."
        exit 1
        ;;
esac

echo "Plesk Installation Completed"
