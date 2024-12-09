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



