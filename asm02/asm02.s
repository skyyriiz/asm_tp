global _start

section .data
    msg: db "Entrez une valeur:",10
    format db "%d",0

section .bss
    x resb 4

section .text

_start:
    ; Print message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 20
    int 0x80

    ; Enter value
    mov eax, 3
    mov ebx, 0
    mov ecx, x
    mov edx, 3
    int 0x80

    ; Print value
    mov eax, 4
    mov ebx, 1
    mov ecx, x
    mov edx, 5
    int 0x80

    mov al, x[0]
    mov ah, x[1]

    cmp ecx, 42
    je ok
    jne end

ok:
    mov eax, 4
    mov ebx, 1
    mov ecx, 1337
    mov edx, 5
    int 0x80

    mov eax, 1 ; sys_exit
    mov ebx, 0 ; code de sortie
    int 0x80

end:
    mov eax, 1 ; sys_exit
    mov ebx, 1 ; code de sortie
    int 0x80