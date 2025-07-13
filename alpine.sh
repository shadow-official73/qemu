#!/bin/bash

# Alpine QEMU Auto-Boot Script

echo "[+] Updating and installing QEMU..."
apt update
apt install -y qemu-system qemu-utils

echo "[+] Downloading Alpine ISO..."
wget https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/x86_64/alpine-standard-3.22.0-x86_64.iso -O alpine.iso

echo "[+] Creating 30G disk image..."
qemu-img create -f qcow2 alpine.qcow2 30G

echo "[+] Making all scripts executable..."
chmod +x *

echo "[+] Booting Alpine Linux in QEMU..."
qemu-system-x86_64 \
  -m 1024 -smp 1 \
  -cdrom alpine.iso \
  -boot d \
  -drive file=alpine.qcow2,format=qcow2 \
  -net nic -net user \
  -nographic
