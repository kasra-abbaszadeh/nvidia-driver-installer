#!/usr/bin/env bash

# NVIDIA Driver Installer
# Author: Kasra
# Updated: 2026

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'


banner() {
echo -e "${CYAN}"
echo "======================================"
echo "      NVIDIA Driver Installer"
echo "      Linux Support Tool"
echo "      Respectfully, Kasra"
echo "======================================"
echo -e "${NC}"
}


check_root() {
if [[ $EUID -eq 0 ]]; then
    echo -e "${RED}Run this script without sudo.${NC}"
    exit 1
fi
}


detect_gpu() {
echo -e "${BLUE}Checking NVIDIA GPU...${NC}"

if ! lspci | grep -i nvidia >/dev/null; then
    echo -e "${RED}No NVIDIA GPU detected.${NC}"
    exit 1
fi

echo -e "${GREEN}NVIDIA GPU detected.${NC}"
}


install_debian() {

echo -e "${YELLOW}Installing NVIDIA driver on Debian...${NC}"

sudo apt update

sudo apt install -y \
linux-headers-$(uname -r) \
dkms \
build-essential \
firmware-misc-nonfree

sudo apt install -y nvidia-driver

echo -e "${GREEN}Debian NVIDIA driver installed.${NC}"
}


install_ubuntu() {

echo -e "${YELLOW}Installing NVIDIA driver on Ubuntu...${NC}"

sudo apt update

sudo apt install -y \
linux-headers-$(uname -r) \
dkms

sudo ubuntu-drivers autoinstall

echo -e "${GREEN}Ubuntu NVIDIA driver installed.${NC}"
}


install_arch() {

echo -e "${YELLOW}Installing NVIDIA driver on Arch Linux...${NC}"

sudo pacman -Syu --noconfirm


kernel=$(uname -r)

echo -e "${BLUE}Kernel: $kernel${NC}"


if [[ $kernel == *lts* ]]; then

    echo -e "${CYAN}LTS kernel detected${NC}"

    sudo pacman -S --noconfirm \
    nvidia-lts \
    nvidia-utils \
    lib32-nvidia-utils \
    nvidia-settings

else

    echo -e "${CYAN}Default kernel detected${NC}"

    sudo pacman -S --noconfirm \
    nvidia-open \
    nvidia-utils \
    lib32-nvidia-utils \
    nvidia-settings

fi


sudo modprobe nvidia || true

echo -e "${GREEN}Arch NVIDIA driver installed.${NC}"

}


main() {

banner

check_root

detect_gpu


PS3="Select distribution: "

select distro in "Debian" "Ubuntu" "Arch"; do

case $distro in

Debian)
    install_debian
    break
    ;;

Ubuntu)
    install_ubuntu
    break
    ;;

Arch)
    install_arch
    break
    ;;

*)
    echo -e "${RED}Invalid option${NC}"
    ;;

esac

done


echo
echo -e "${GREEN}"
echo "Installation finished."
echo "Please reboot your system."
echo -e "${NC}"

}


main
