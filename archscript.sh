# create two partitions
# /dev/sda1/ - 82 Linux swap / Solaris 
# /dev/sda2/ - 83 Linux


# Formatting to ext4 /dev/sda2
mkfs.ext4 -F /dev/sda2 

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
arch-chroot /mnt ./archscript2.sh

