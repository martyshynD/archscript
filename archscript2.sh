# Activate Internet 
systemctl start NetworkManager 

# nmtui
nmtui

# Enable NetworkManager
systemctl enable NetworkManager

# New User 
useradd -m -G wheel fortis
passwd fortis 

# Allow root for all users
echo '%wheel ALL=(ALL:ALL) ALL' >> /etc/sudoers

# Graphics driver 
pacman -S xf86-video-intel -y 
pacman -S xorg -y 


