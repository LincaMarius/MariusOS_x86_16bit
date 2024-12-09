# An Operating System for the x86 architecture
This Operating System is designed to run on computers that use the x86 Architecture.

By: Lincă Marius Gheorghe.

Pitești, Argeș, România, Europe.

https://github.com/LincaMarius

## About the project, brief description
Through this project I want to improve my knowledge of operating systems and perfect my programming knowledge in assembly language and C.

References: \
OS Dev.org Wiki: \
https://wiki.osdev.org/Expanded_Main_Page

Ralf Brown's Interrupt List: \
https://www.ctyme.com/intr/int.htm

## Prerequisites
I have done this project using Linux Ubuntu running in a virtual machine. This approach is essential because it writes to the disk drives at the boot sector level and implicitly the partition table, and any programming error can cause the execution of the compiled code to cause the loss of all data on the computer.

For a fresh installation of the Ubuntu system in the virtual machine, the following commands must be run: \
*sudo apt update* \
*sudo apt install build-essential*

At this point we should have Make and GCC installed and working. We can verify this by typing the commands: \
*gcc --version* \
*make --version*

Developing an operating system requires writing code in Assembly Language, in this case to write the code for the Bootloader. For this we need an Assembler program. I chose to use the NASM assembler.

To install the NASM assembler, the following command must be run: \
*sudo apt install nasm*

We verify that the NASM assembler is working correctly: \
*nasm --version*

To test the written and compiled code to see if it works correctly, we need an emulator or a virtual machine that runs the operating system in the different stages of development. Testing on real hardware is done after we have reached a desired level of functionality, a target initially set.
I chose the QEMU program for testing. It is installed using the command: \
*sudo apt install qemu-system*

We verify that the NASM assembler is working correctly: \
*qemu-system-i386 --version*

Now we have the working environment ready to start writing code to develop an operating system.

Developing an operating system can be accomplished through several steps.

## Step 1 – Boot loader
Specific to computers built with x86 processors is the Boot Process

The Booting process involves loading the necessary files from an internal or external storage medium into the computer's memory and executing them. These files are the Kerner and Drivers. In x86 systems a file can only be run if it is in RAM

The first step in the process of loading an operating system is for the BIOS to load and execute the Boot sector. This is also called the Boot Loader.

We can use an existing Boot Loader such as GRUB or we can create our own Boot Loader.

I approached the booting in two stages, so the Boot Loader will load the Loader.bin file.

## Step 2 – Loader
The loader's role is to initialize the computer's elements in the desired state and to gather information about the system.

This information is collected using the BIOS and is saved for use by the Kernel, as it no longer has access to BIOS functions.

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

