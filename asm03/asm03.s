section .data
    string db '1337', 0
    string_len equ $-string
section .bss
    input resb 4

global _start

section .text
_start:

    POP. ecx ; on recupere l'adresse de arg1 dans ecx       
    add esp, 4 ; on decale l'adresse de arg1 de 4 octets
    mov ecx, [esp] ; on recupere l'adresse de arg2 dans ecx
    
    cmp byte[ecx], 0x34 
    jne exit
    cmp byte[ecx+1], 0x32
    jne exit
    
    mov eax, 4    
    mov ebx, 1
    mov ecx, string    
    mov edx, string_len        
    int 0x80
    
    mov eax, 1        
    mov ebx, 0    
    int 0x80
    
exit:
    mov eax, 1        
    mov ebx, 1    
    int 0x80
