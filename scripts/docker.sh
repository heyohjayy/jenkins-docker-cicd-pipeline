#!/usr/bin/env bash
#
# This script is provided as a manual
# installation guide.
#
# Run each command individually.
# It is intentionally not idempotent.

# Docker requires SSH (22) and
# application access on port 8081.

# Set hostname
sudo hostnamectl set-hostname docker
sudo su - ubuntu

# Update package index
sudo apt update

# Install Docker
sudo apt install docker.io -y

# Verify Docker installation
docker --version

# Enable Docker service at boot
sudo systemctl enable docker

# Start Docker service
sudo systemctl start docker

# Check Docker service status
sudo systemctl status docker --no-pager
sudo systemctl is-active docker

# Allow current user to run Docker commands
sudo usermod -aG docker ubuntu

# Apply new group membership
newgrp docker

# Verify Docker works correctly
docker run hello-world

# Docker images
docker images

# Docker containers
docker ps -a

# Public IP
curl ifconfig.me

# Access deployed application
# (after Jenkins deploys the application)

# http://<PUBLIC_IP>:8081
