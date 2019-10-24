cd /Users/renandelucaavila/Desktop/LabEmbarcados/E10
arm-none-eabi-as -c -mcpu=arm926ej-s -g irq.s -o irq.o
arm-none-eabi-gcc -c -mcpu=arm926ej-s -Wall -Wextra -g handler.c -o handler.o
arm-none-eabi-ld -T test.ld irq.o handler.o -o program.elf
arm-none-eabi-objcopy -O binary program.elf program.bin

cd /Users/renandelucaavila/Desktop/LabEmbarcados/lab_embarcados/dozero/qemu-4.1.0
./configure --target-list=arm-softmmu
make

