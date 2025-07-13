# 🐧 QEMU Alpine Boot Script

This project provides a simple shell script to boot **Alpine Linux** using **QEMU** on a Debian/Ubuntu-based system.

---

## 📦 Features

- Installs required QEMU packages
- Downloads latest Alpine Linux ISO (v3.22)
- Creates a 30GB virtual disk
- Boots Alpine in `-nographic` mode
- Prompts user for:
  - RAM size (`1gb`, `2gb`, etc.)
  - CPU cores (`1`, `2`, etc.)

---

## 🚀 Quick Start

```bash
git clone https://github.com/shadow-official73/qemu.git
cd qemu
bash alpine.sh
