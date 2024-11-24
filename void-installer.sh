#!/bin/bash
# Automate the process of setting up Void Linux

bypass() {
  sudo -v
  while true;
  do
    sudo -n true
    sleep 45
    kill -0 "$$" || exit
  done 2>/dev/null &
}

echo "Updating Repos..."
sleep 3s
	sudo xbps-install -Syu
	sudo xbps-install -Sy void-repo-nonfree

clear
echo "Installing packages..."
sleep 3s
	# XFCE4
	sudo xbps-install xfce4-notifyd xfce4-panel xfce4-pulseaudio-plugin xfce4-screenshooter xfce4-session xfce4-settings xfce4-taskmanager xfce4-terminal Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin xfwm4 xfdesktop gvfs xfce-polkit xdg-utils xdotool paper-icon-theme
  #Xorg
  sudo xbps-install -Sy xorg-minimal xf86-video-amdgpu xf86-input-libinput xinit
# Fonts
	sudo xbps-install -Sy font-hack-ttf fontconfig freetype google-fonts-ttf noto-fonts-emoji noto-fonts-ttf nerd-fonts-ttf
	# General graphics drivers
	sudo xbps-install -Sy vkd3d vulkan-loader  
	# AMD drivers
	sudo xbps-install -Sy linux-firmware-amd xf86-video-amdgpu mesa-ati-dri mesa-vulkan-radeon	mesa-vulkan
  # Build essentials
	sudo xbps-install -Sy linux-tools make cmake rsync base-devel cargo rust meson sassc python3-pip nodejs lazygit git wget curl build ninja meson 
	#other
	sudo xbps-install -Sy octoxbps

echo "Configuring system...

	sudo rm -f /var/service/agetty-tty{3,4,5,6}
	sudo ln -s /etc/sv/ntpd /var/service/
	sudo ln -s /etc/sv/dbus /var/service/
	sudo ln -s /etc/sv/elogind /var/service/
	sudo ln -s /etc/sv/polkitd /var/service/
	sudo ln -s /etc/sv/ufw /var/service/
	#sudo ln -s /etc/sv/cupsd /var/service/
	#sudo ln -s /etc/sv/uuidd /var/service/
	sudo ln -s /etc/sv/alsa /var/service/
udo resolvconf -u

	#sudo ufw default deny
	#sudo ufw allow from 192.168.0.0/24
	#sudo ufw logging off
	#sudo ufw enable

	sudo mkdir /etc/sysctl.d/
	echo 'vm.swappiness=10' | sudo tee /etc/sysctl.d/99-swappiness.conf

	sudo ln -s /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d/
	sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
	sudo ln -s /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/
	sudo ln -s /usr/share/fontconfig/conf.avail/50-user.conf /etc/fonts/conf.d/
	sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/

	sudo chsh -s /usr/bin/bash $USER
clear
read -p "Done"
