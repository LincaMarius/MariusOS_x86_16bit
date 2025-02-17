# An Operating System for the x86 architecture
This Operating System is designed to run on IBM PC-comparable Computers that use the x86 Architecture.

By: Lincă Marius Gheorghe.

Pitești, Argeș, Romania, Europe.

https://github.com/LincaMarius

## About the project, brief description
Through this project I want to improve my knowledge of Operating Systems and perfect my programming knowledge in Assembly language and C.

References: \
OS Dev.org Wiki: \
https://wiki.osdev.org/Expanded_Main_Page

Ralf Brown's Interrupt List: \
https://www.ctyme.com/intr/int.htm

## Prerequisites
I have done this project using Linux Ubuntu running in a virtual machine. This approach is essential because creating an operating system requires writing to disk drives at the boot sector level and implicitly the partition table, and any programming error can cause the execution of the compiled code to result in the loss of all data on the working computer.

To work safely on developing an operating system, the best solution is to use a virtual machine such as: VMware Workstation Player, Hyper-V, VirtualBox, QEMU, Gnome Boxes, etc.

I will use the VirtualBox software running on Windows 11.

1. After a fresh installation of the Ubuntu system in the virtual machine, the following commands must be run: \
*sudo apt update* \
*sudo apt install build-essential*

At this point we should have Make and GCC installed and working. We can verify this by typing the commands: \
*gcc --version* \
*make --version*

2. Developing an operating system requires writing code in Assembly Language, in this case to write the code for the Bootloader. For this we need an Assembler program. I chose to use the NASM Assembler.

To install the NASM assembler, the following command must be run: \
*sudo apt install nasm*

We verify that the NASM assembler is working correctly: \
*nasm --version*

3. To test the written and compiled code if it works correctly we need an Emulator or a Virtual Machine that runs the new Operating System in the different stages of development. Testing on real hardware is done after we have reached a desired level of functionality, an initially established target.

I chose the QEMU program for testing. It is installed using the command: \
*sudo apt install qemu-system*

We verify that the QEMU software was successfully installed and is working correctly: \
*qemu-system-i386 --version*

Now we have the working environment ready to start writing code to develop an Operating System.

Developing an operating system can be accomplished through several steps.

## Step 1 – Boot loader
Specific to computers built with x86 processors is the Boot Process

The Booting process involves loading the necessary files from an internal or external storage medium into the computer's memory and executing them. The main files required for an Operating System to function properly are the Kernel and Drivers. In x86 systems a file can only be run if it is already loaded into RAM.

The first step in the process of loading an operating system is the loading and launching of the Boot sector by the BIOS. It is also called the Boot Loader. This process occurs automatically when the computer is started and is made possible by the execution of a special code that is stored in a ROM (EEPROM type) memory located on the computer's motherboard and is called the BIOS.

We can use an existing Boot Loader such as GRUB or we can create our own Boot Loader.

I have approached the boot process in two stages, so the Boot Loader (which is in the Boot Sector) will load the Loader.bin file

## Step 2 – The Loader
The loader's role is to gather information about the system and, based on this, initialize the computer's hardware elements in the desired initial state necessary for an x86 computer to function correctly.

This information is collected using BIOS calls and is saved for later use by the Kernel, as it no longer has access to BIOS functions if 32-bit or 64-bit (Protected Mode) operation is desired.

## Step 3 – The Kernel
The kernel is the heart of any Operating System. It controls all the activities that take place on that computer.

The main activity of the Kerner is to manage system resources and allow their most efficient sharing between programs called processes.

## Step 4 – Drivers
Drivers are software components that allow the operating system to interface with the system's hardware elements.

Drivers have the role of translating abstract Kerner commands into commands specific to the hardware components present in the system.

## Step 5 – Applications
The purpose of any system used by humans is to perform certain functions that satisfy a need.

Any computer must run applications with different practical application areas

These applications can be developed specifically for this operating system or ported from other platforms. This usually involves modifying the source code and compiling it.

For this purpose, any Operating System provides programmers with an API (Application Programming Interface)

