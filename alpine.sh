#!/bin/bash

# Install QEMU
echo "[+] Installing QEMU tools..."
apt update
apt install -y qemu-system qemu-utils

# Download Alpine Linux ISO
echo "[+] Downloading Alpine ISO..."
wget https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/x86_64/alpine-standard-3.22.0-x86_64.iso -O alpine.iso

# Create a 30G QCOW2 disk image
echo "[+] Creating QCOW2 disk (30G)..."
qemu-img create -f qcow2 alpine.qcow2 30G

# Boot with QEMU
echo "[+] Booting Alpine in QEMU..."
qemu-system-x86_64 \
  -m 1024 -smp 1 \
  -cdrom alpine.iso \
  -boot d \
  -drive file=alpine.qcow2,format=qcow2 \
  -net nic -net user \
  -nographic
