section .data
    string db '1337', 0
    string_len equ $-string
section .bss
    input resb 4 

global _start

section .text
_start:

    pop ecx        
    add esp, 4        
    mov ecx, [esp]    

    cmp byte[ecx], 0x34 
    jne exit
    cmp byte[ecx+1], 0x32
    jne exit

    mov eax, 4
    mov ebx, 1
    mov ecx, string
    mov edx, string_len
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h


exit:

    mov eax, 1
    mov ebx, 1
    int 80h