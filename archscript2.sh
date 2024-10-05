
# timezone 
timedatectl set-timezone Europe/Kyiv

# set to system clock 
hwclock --systohc 

# locales
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen 

# generate locale 
locale-gen

# locales 2 
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf 

# Root password
passwd

# Boot Loader
pacman -S grub networkmanager network-manager-applet dialog wireless_tools wpa_supplicant os-prober mtools dosfstools base-devel linux-headers -y 

# Install grub 
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg 

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


