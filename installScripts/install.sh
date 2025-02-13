#!/bin/bash

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/

# Install pkgs
yay -S waybar sddm swaync-client starship myfetch uwsm neovim python-pywalfox hypridle hyprpicker hyprshot hyprlock pyprland wlogout fd cava brightnessctl nerd-fonts nwg-look htop blueman bluez stow hyprland wofi cliphist grim slurp libnotify xdg-desktop-portal-hyprland hyprpolkitagent-bin qt5-wayland qt6-wayland tmux zen-browser-bin zsh kitty yazi thunar ripgep network-manager-applet pipewire pipewire-pulse pipewire-alsa pipewire-jack pavucontrol pulsemixer pywal swww
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Generate colors
wal -i ~/dotfiles/wallpapers/Frieren-Dead-Stare.png -n

# Enable some services
sudo systemctl enable bluetooth
sudo systemctl enable sddm.service
systemctl --user enable pipewire.service pipewire-pulse.service
systemctl --user start pipewire.service pipewire-pulse.service

# Change shell
chsh -s /usr/bin/zsh

#Copy dotfiles
cd ~/dotfiles
stow .
