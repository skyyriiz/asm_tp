global _start

section .data
    message db "1337",10

section .text
    global _start

_start:
    ; afficher 1337
    mov eax, 4 ; sys_write
    mov ebx, 1 ; stdout
    mov ecx, message ; message
    mov edx, 5 ; taille du message
    int 0x80 

    ; exit 0
    mov eax, 1 ; sys_exit
    mov ebx, 0 ; code de sortie
    int 0x80
    