#!/bin/bash

# Alpine QEMU Auto-Boot Script (User input: 1gb / 2gb format)

echo "==============================="
echo "  Alpine QEMU Boot Setup"
echo "==============================="

# Ask user for RAM size like "1gb" or "2gb"
read -p "Enter RAM size (e.g. 1gb, 2gb): " RAM_INPUT
read -p "Enter number of CPU cores (e.g. 1, 2): " SMP

# Convert RAM to MB
RAM_MB=$(echo "$RAM_INPUT" | sed 's/[^0-9]*//g')
RAM_MB=$((RAM_MB * 1024))  # Convert GB to MB

# Fallback defaults
RAM_MB=${RAM_MB:-1024}
SMP=${SMP:-1}

echo "[+] RAM set to ${RAM_MB} MB"
echo "[+] CPU cores set to ${SMP}"

echo "[+] Updating and installing QEMU..."
apt update
apt install -y qemu-system qemu-utils

echo "[+] Downloading Alpine ISO..."
wget https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/x86_64/alpine-standard-3.22.0-x86_64.iso -O alpine.iso

echo "[+] Creating 30G disk image..."
qemu-img create -f qcow2 alpine.qcow2 30G

echo "[+] Booting Alpine Linux in QEMU..."
qemu-system-x86_64 \
  -m "$RAM_MB" -smp "$SMP" \
  -cdrom alpine.iso \
  -boot d \
  -drive file=alpine.qcow2,format=qcow2 \
  -net nic -net user \
  -nographic
