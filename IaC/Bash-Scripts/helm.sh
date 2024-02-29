#!/bin/bash

# Step 1: Download Helm signing key and add to keyring
curl -fsSL https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null

# Step 2: Install apt-transport-https
sudo apt-get install -y apt-transport-https

# Step 3: Add Helm repository to sources.list.d
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

# Step 4: Install Helm
sudo apt-get update
sudo apt-get install -y helm
