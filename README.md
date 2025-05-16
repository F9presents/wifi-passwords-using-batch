# 🔐 WiFi Password Viewer (Batch Script)

A simple Windows Batch script that displays all saved Wi-Fi network names (SSIDs) and their stored passwords.

> ⚠️ For educational and personal use only.

---

## 📦 Features

- Lists all saved Wi-Fi profiles on your system
- Displays stored passwords for each profile (if available)
- Lightweight & no installation required

---

## 🖥️ How It Works

This script uses built-in Windows commands:

```cmd
netsh wlan show profiles
netsh wlan show profile name="WiFiName" key=clear
