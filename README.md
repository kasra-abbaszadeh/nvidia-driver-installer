# NVIDIA Linux Driver Installer 🚀

A lightweight Bash script designed to simplify the installation process of NVIDIA drivers on Linux distributions.

This project automates the required steps for installing NVIDIA drivers and provides a simple interactive interface for users. It supports multiple Linux distributions and handles dependencies, kernel detection, and driver installation automatically.

## ✨ Features

* 🔍 NVIDIA GPU detection
* 🐧 Support for popular Linux distributions:

  * Debian
  * Ubuntu
  * Arch Linux
* ⚙️ Automatic dependency installation:

  * DKMS
  * Linux Headers
  * Build Tools
* 🧩 Kernel detection for Arch Linux
* 🚀 Support for:

  * Standard Linux kernels
  * LTS kernels
* 🎨 Color-based terminal interface
* 📦 Uses official package managers:

  * APT
  * Pacman
* 🔄 Automatic system update before installation
* 🛠️ Simple interactive installation menu

## 🎯 Project Goal

The goal of this project is to make NVIDIA driver installation easier for Linux users by reducing manual configuration steps and providing an automated, reliable installation workflow.

This project is also created as a learning experience for:

* Bash scripting
* Linux system administration
* Package management
* Hardware driver automation

## 🖥️ Supported Distributions

| Distribution | Status      |
| ------------ | ----------- |
| Debian       | ✅ Supported |
| Ubuntu       | ✅ Supported |
| Arch Linux   | ✅ Supported |

## ⚙️ Installation & Usage

Clone the repository:

```bash
git clone https://github.com/yourusername/NVIDIA-Linux-Driver-Installer.git
```

Navigate to the project directory:

```bash
cd NVIDIA-Linux-Driver-Installer
```

Make the script executable:

```bash
chmod +x installer.sh
```

Run the installer:

```bash
./installer.sh
```

After the installation is completed, reboot your system.

## ⚠️ Requirements

* NVIDIA GPU
* Linux operating system
* Internet connection
* sudo privileges

## 📌 Notes

* Always make sure your system is backed up before changing GPU drivers.
* The script uses official Linux repositories to install NVIDIA drivers.
* After installation, a system reboot is required to load the new driver.

## 🤝 Contribution

Contributions, improvements, and bug reports are welcome. Feel free to open an issue or submit a pull request.

## 📜 License

This project is open-source and available for educational and personal use.

---
