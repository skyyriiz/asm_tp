# Get name of the folder for the compilation
name="${PWD##*/}"

nasm -f elf64 -o $name.o $name.s
ld -s -o $name $name.o
./$name

