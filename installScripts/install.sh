#!/bin/bash

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/

# Install pkgs
yay -S pywal swww
wal -i ~/dotfiles/wallpapers/Frieren-Dead-Stare.png -n
yay -S waybar sddm swaync-client starship myfetch uwsm neovim python-pywalfox hypridle hyprpicker hyprshot hyprlock pyprland wlogout fd cava brightnessctl nerd-fonts nwg-look htop blueman bluez stow hyprland wofi cliphist grim slurp libnotify xdg-desktop-portal-hyprland hyprpolkitagent-bin qt5-wayland qt6-wayland tmux zen-browser-bin zsh kitty yazi thunar
systemctl enable bluetooth
systemctl enable sddm.service # Don't know if it work
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
yay -S pipewire pipewire-pulse pipewire-alsa pipewire-jack pavucontrol pulsemixer 
systemctl --user enable pipewire.service pipewire-pulse.service
systemctl --user start pipewire.service pipewire-pulse.service

# Change shell
chsh -s /usr/bin/zsh

# Hyprland Plugin
hyprpm update
hyprpm add https://github.com/virtcode/hypr-dynamic-cursors
hyprpm enable dynamic-cursors

#Copy dotfiles
cd ~/dotfiles
stow .
