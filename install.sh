#!/bin/bash

# Set colemak_dh tty keymap
localectl set-keymap --no-convert mod-dh-ansi-us

# Pacman update
sudo pacman -Syu

# Install yay
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd .. && rm -rf yay # Cleanup

# Install packages
sudo pacman -S - < ./confs/pkglist.txt
yay -S - < ./confs/yaypkglist.txt --noconfirm

# Install gems
gem install colorls

# Set all the configs
stow . -R --override='*'

# catppuccin sddm theme
wget https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-mocha.zip
if [ ! -d "/usr/share/sddm/themes/"]; then
  sudo mkdir /usr/share/sddm/themes/
fi
sudo unzip catppuccin-mocha.zip -d /usr/share/sddm/themes/ 
rm -rf catppuccin-mocha.zip # Cleanup
CURRENT_USER=$(whoami)
sed -i "s/{{USER}}/${CURRENT_USER}/g" "./confs/sddm.conf"
sudo cp ./confs/sddm.conf /etc/sddm.conf.d/

# Grub theme
git clone https://github.com/catppuccin/grub.git
cd grub
sudo cp -r src/* /usr/share/grub/themes/
cd .. && rm -rf grub #Cleanup
if greb -q "GRUB_THEME" /etc/default/grub; then
 sudo sed -i "s/.*GRUB_THEME.*/GRUB_THEME=/usr/share/grub/themes/catppuccin-mocha-grub-theme/theme.txt" /etc/default/grub
else
  sudo echo "GRUB_THEME=/usr/share/grub/themes/catppuccin-mocha-grub-theme/theme.txt" >> /etc/default/grub
fi
sudo mkconfig -o /boot/grub/grub.cfg

# Enable sddm 
sudo systemctl enable sddm
