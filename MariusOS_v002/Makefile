ASM = nasm

SRC_DIR = src/Boot
BUILD_DIR = build

$(shell mkdir -p $(BUILD_DIR))

$(BUILD_DIR)/floppy.img: $(BUILD_DIR)/Boot.bin
	dd if=/dev/zero of=$(BUILD_DIR)/floppy.img bs=1024 count=1440
	dd if=$(BUILD_DIR)/Boot.bin of=$(BUILD_DIR)/floppy.img conv=notrunc

$(BUILD_DIR)/Boot.bin: $(SRC_DIR)/BootFAT12.asm
	$(ASM) $(SRC_DIR)/BootFAT12.asm -f bin -o $(BUILD_DIR)/Boot.bin