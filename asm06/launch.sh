# Get name of the folder for the compilation
name="${PWD##*/}"

nasm -f elf32 -g -o $name.o $name.s
ld -m elf_i386 -o $name $name.o
./$name 50 50


