;
; Boot Loader for 1.44 mb Floppy Disk
;
; Linca Marius Gheorghe
;
; Version 0.2 = Display letters '1', '2' and '3' consecutively
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

; Before using the Processor Registers it is advisable to initialize them to a known State
; Set all Segments to zero

    ;assembly code  ;/alternative code variant  ;// equivalent c code   ;comment
    xor ax, ax      ;/mov ax, 0                 ;//a = 0;               ;make ax zero  
    mov ds, ax                                                          ;make Data Segment zero
    mov es, ax                                                          ;make Extra Segment zero

; Stack setup
; Because at this point interrupts such as RTC ticks or user key presses may occur, and any interrupt causes a subroutine in the BIOS to be called, which implies the use of the Stack, we must disable interrupts.
; For example, theoretically if we modify the Stack Segment or Stack Pointer when an interrupt occurs, the return value from a subroutine may be lost.
; For safety it is recommended to disable interrupts when setting up the new Stack
    cli                                                                 ;disable interrupts
    mov ss, ax                                                          ;make Stack Segment zero
    mov sp, 0xFFFF                                                      ;set stack to guarantee data safety
    ;mov bp, sp                                                         ;optional Base Pointer Set
    sti                                                                 ;enable interrupts

; We display the character '1'
    mov al, '1'                             ;// int ch = '1';           ;ASCII character to write
    call printchar                          ;// putchar(ch);            ;subroutine call      

; We display the character '2'
    mov al, '2'                             ;// int ch = '2';           ;ASCII character to write
    call printchar                          ;// putchar(ch);            ;subroutine call      

; We display the character '3'
    mov al, '3'                             ;// int ch = '3';           ;ASCII character to write
    call printchar                          ;// putchar(ch);            ;subroutine call      


; if we get here something went wrong and we execute an infinite loop
halt:
	hlt         ; stops CPU from execuring code, it can be resumed by an interrupt.
	jmp halt
    jmp $       ; if we get here something went wrong and we execute an infinite loop
    jmp halt


; A function for displaying a character
; Display a character on the screen, advancing the cursor and scrolling the screen as necessary
; Characters 0x07 (BEL), 0x08 (BS), 0x0A (LF), and 0x0D (CR) are interpreted and do the expected things

    ;assembly code  ;/alternative code variant  ;// equivalent c code   ;comment
printchar:                                      ;// int putchar(int ch)
    ; Parameters:
    ; AL = ASCII character to write             ;// int ch

	push ax                                                             ;we save the contents of ax on the stack because this function alters its contents 
    push bx                                                             ;we save the contents of bx on the stack because this function alters its contents
    mov ah, 0x0E                                                        ;write character in TTY Mode
	xor bh, bh      ;/mov bh, 0                                         ;page number in text mode
	int 10h                                                             ;call BIOS   
    ; Return: Nothing

    pop bx                                                              ;we restore the contents of bx from the stack
    pop ax                                                              ;we restore the contents of ax from the stack
    ret                                                                 ;return from subroutine                                                            

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