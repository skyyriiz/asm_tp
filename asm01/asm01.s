global _start

section .data
    message db "13",10

section .text
    global _start

_start:
    ; afficher 1337
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, 4
    int 0x80

    ; exit 0
    mov eax, 1
    mov ebx, 0
    int 0x80
    