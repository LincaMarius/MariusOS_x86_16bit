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

For a fresh installation of the Ubuntu system in the virtual machine, the following commands must be run:
- sudo apt update
- sudo apt install build-essential
- sudo apt install qemu-system
- sudo apt install nasm

Now we have the working environment ready to start writing code to develop an operating system.



