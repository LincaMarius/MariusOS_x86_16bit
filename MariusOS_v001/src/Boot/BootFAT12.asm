;
; Boot Loader for 1.44 mb Floppy Disk
;
; Linca Marius Gheorghe
;
; Version 0.1 = I made the Boot Loader have a fixed length of 512 bytes and at the end it has the signature 0xAA55
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; NASM assembler syntax
; The Intel 8086 CPU Instruction Set is used

; At Power On or after Reset any x86 Processor starts running in 16-bit mode, basically a modern processor behaves like a very fast Intel 8086 Processor
; The CPU at this stage can only address 1 MB of RAM

; There are two methods of booting a Computer:
; 1. EFI Booting process - new modern method
;	- BIOS looks into special EFI partitions on each bootable device
;	- Operating System must be compiled as an EFI program
; 2. Legacy Booting process - old method
;	-BIOS loads firs sector of each bootable device into memory at location 0x7C00
;	-BIOS checks for 0xAA55 signature at location 0x7C00 + 512 - 2 = 0x7C00 + 0x200 - 2 = 0x7E00 - 2 = 0x7DFE
;	-If found BIOS start executing code at location 0x7C00
; For now I will implement the second method because it is easier to implement and can be used on older computers.

org 0x7C00      ; assembler directive that tell assembler where our code to be loaded. 
		        ; the assembler uses this information to calculate all labels and variables addresses.
                ; in this way all jumps and calls are executed at correct addresses

bits 16         ; assembler directive that tell assembler to emit 16 bit code

; Initial Memory MAP
; 0x00000-0x003FF = BIOS Data
; 0x00400-0x07BFF = free
; 0x07C00-0x07DFF = Boot Loader
; 0x07e00-0x9FFFF = free
; 0xA0000-0xBFFFF = Video RAM
; 0xC0000-0xFFFFF = BIOS ROM

; Start of executable code
start:
  
; if we get here something went wrong and we execute an infinite loop
halt:
	hlt         ; stops CPU from execuring code, it can be resumed by an interrupt.
	jmp halt
    jmp $       ; if we get here something went wrong and we execute an infinite loop
    jmp halt

; the boot sector must have a fixed size of 512 bytes
; for this purpose we fill the remaining space with zeros
zeroPadding:
    times 510-($-$$) db 0 ; it can also be written like this:
                                ; times 510-(endOfBootSector-start) db 0 

; adding valid boot sector signature at the end
validBootSectorSignature:
    db 0x55, 0xAA       ; it can also be written like this:
                            ;dw 0xAA55 ; it is little endian

endOfBootSector: