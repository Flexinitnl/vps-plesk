#!/bin/bash

# List of Plesk extensions to install
extensions=(
    aast-dnssec
    action-log
    advisor
    aps-autoprovision
    azuredns
    baqend
    composer
    configurations-troubleshooter
    diskspace-usage-viewer
    dnssec
    dns-transfer
    docker
    domain-connect
    email-migration
    firewall
    git
    kaspersky-av
    kolab
    laravel
    letsencrypt
    mfa
    nodejs
    one-drive-backup
    panel-ini-editor
    patchmaninstaller
    plesk-mobile
    repair-kit
    sectigo
    site-import
    social-login
    ssh-keys
    ssh-terminal
    slave-dns-manager
    social-login
    support-access
    website-virus-check
    wp-toolkit

)

# Install Plesk extensions
for extension in "${extensions[@]}"; do
    echo "Installing $extension"
    plesk bin extension --install "$extension"
done

plesk installer --select-release-current --install-component pmm