# The Boot Loader
The Booting process involves loading the necessary files from an internal or external storage medium into the computer's memory and executing them. The main files required for an Operating System to function properly are the Kernel and Drivers. In x86 systems a file can only be run if it is already loaded into RAM.

The first step in the process of loading an operating system is the loading and launching of the Boot Sector by the BIOS. It is also called the Boot Loader. This process occurs automatically when the computer is powered on and is made possible by the execution of a special code that is stored in a ROM Memory (EEPROM type) located on the computer's motherboard and is called BIOS.

We can use an existing Boot Loader such as GRUB or we can create our own Boot Loader.

I have approached the boot process in two stages, so the Boot Loader (which is in the Boot Sector) will load the Loader.bin file

The Boot Sector can load from Boot Media: \
- An Operating System installation program \
- An already installed Operating System

The Boot Loader also differs depending on the boot Media.

The Boot Loader also differs greatly depending on the File System that is on the bootable Media.

Now I will create a Boot Loader step by step for a Floppy Disk with a capacity of 1.44 Mbytes that has the FAT12 File System.

### Version 0.1
Version 0.1 is recognized by the BIOS as a Boot Sector because it is 512 bytes in size and has the signature 0xAA55 at the end.

https://github.com/LincaMarius/MariusOS_x86_16bit/blob/main/Versions/MariusOS_v001.zip

### Version 0.2
Version 0.2 will display the letters '1', '2' and '3' consecutively on the screen.

https://github.com/LincaMarius/MariusOS_x86_16bit/blob/main/Versions/MariusOS_v002.zip
