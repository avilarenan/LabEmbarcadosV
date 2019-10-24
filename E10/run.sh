arm-none-eabi-as -c -mcpu=arm926ej-s -g irq.s -o irq.o
arm-none-eabi-gcc -c -mcpu=arm926ej-s -Wall -Wextra -g handler.c -o handler.o
# arm-none-eabi-as -c -mcpu=arm926ej-s -g handler.s -o handler.o
arm-none-eabi-ld -T test.ld irq.o handler.o -o program.elf
arm-none-eabi-objcopy -O binary program.elf program.bin
qemu-system-arm -M versatilepb -m 128M -nographic -s -S -kernel program.bin