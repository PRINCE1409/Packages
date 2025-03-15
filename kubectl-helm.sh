#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check and install kubectl
echo "Checking for kubectl..."
if command_exists kubectl; then
    echo "kubectl is already installed on this system"
    kubectl version --client
else
    echo "Installing kubectl..."
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    if [ $? -eq 0 ]; then
        sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
        if [ $? -eq 0 ]; then
            echo "kubectl installed successfully"
            kubectl version --client
        else
            echo "Error: Failed to install kubectl"
            exit 1
        fi
    else
        echo "Error: Failed to download kubectl"
        exit 1
    fi
    # Clean up
    [ -f kubectl ] && rm kubectl
fi

echo -e "\n------------------------\n"

# Check and install Helm
echo "Checking for Helm..."
if command_exists helm; then
    echo "Helm is already installed on this system"
    helm version
else
    echo "Installing Helm..."
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    if [ $? -eq 0 ]; then
        chmod 700 get_helm.sh
        ./get_helm.sh
        if [ $? -eq 0 ]; then
            echo "Helm installed successfully"
            helm version
        else
            echo "Error: Failed to install Helm"
            exit 1
        fi
    else
        echo "Error: Failed to download Helm installation script"
        exit 1
    fi
    # Clean up
    [ -f get_helm.sh ] && rm get_helm.sh
fi
