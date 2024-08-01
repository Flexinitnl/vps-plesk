#!/bin/bash

# List of Plesk extensions to install
extensions=(
    advisor
    composer
    firewall
    docker
    sectigo
    dnssec
    domain-connect
    aast-dnssec
    email-migration
    kaspersky-av
    social-login
    action-log
    plesk-mobile
    diskspace-usage-viewer
    baqend
    kolab
    one-drive-backup
    azuredns
    dns-transfer
    support-access
    aps-autoprovision
    git
    website-virus-check
    letsencrypt
    panel-ini-editor
    ssh-keys
    slave-dns-manager
)

# Install Plesk extensions
for extension in "${extensions[@]}"; do
    echo "Installing $extension"
    plesk bin extension --install "$extension"
done