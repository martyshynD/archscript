# create two partitions
# /dev/sda1/ - 82 Linux swap / Solaris 
# /dev/sda2/ - 83 Linux


# Formatting to ext4 /dev/sda2
mkfs.ext4 /dev/sda2 

# Make Swap 
mkswap /dev/sda1
swapon /dev/sda1

# Mounting Disk Partition 
mount /dev/sda2 /mnt 

# Install basic linux firmware 
pacstrap /mnt base linux linux-firmware nano 

# Creating Fstab File
genfstab -U /mnt >> /mnt/etc/fstab 

# arch-chroot 
arch-chroot /mnt 

# timezone 
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

# set to system clock 
hwclock --systohc 

# locales
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen 

# generate locale 
locale-gen

# locales 2 
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf 

# hostname 
echo 'arch' >> /etc/hostname

# hosts 
echo '
127.0.0.1       localhost
::1             localhost
127.0.1.1       arch.localdomain        arch
' >> ~/etc/hosts 

# Root password
passwd

# Boot Loader
pacman -S grub networkmanager network-manager-applet dialog wireless_tools wpa_supplicant os-prober mtools dosfstools base-devel linux-headers -y 

# Install grub 
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg 

# Rebot system 
reboot

 

