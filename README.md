# Kubernetes Tools Installation Script

## Overview
This bash script installs `kubectl` and `Helm` on a Linux system (amd64 architecture) with error handling and version checking.

## Features
- Checks if tools are already installed
- Installs latest stable `kubectl` version
- Installs `Helm` using official installation script
- Includes error handling for downloads and installation
- Cleans up temporary files
- Displays version information

## Prerequisites
- Linux system (amd64)
- curl
- sudo privileges

## Usage
1. Save the script as `kubectl&helm.sh`
2. Make it executable:
```bash
chmod +x kubectl&helm.sh
