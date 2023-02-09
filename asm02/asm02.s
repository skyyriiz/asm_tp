global _start

section .data
    annonce db 'Entrez une valeur: ', 0
    msg db "1337",10

section .bss
    x resb 4

section .text

_start:
    ; Print message
    mov eax, 4
    mov ebx, 1
    mov ecx, annonce
    mov edx, 19
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

    ; Check 1st char of our value and compare to the 1st of "42"
    mov al, x[0]
    cmp al, '4'
    jne end

    ; Check 2nd char of our value and compare to the 2nd of "42"
    mov bl, x[1]
    cmp bl, '2'
    jne end

    ; Check 3rd char of our value and compare to the 3rd of "42"
    mov cl, x[2]
    cmp cl, 10
    jne end


ok:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 4
    int 0x80

    mov eax, 0
    mov ebx, 0
    int 0x80
    
end:
    mov eax, 1 ; sys_exit
    mov ebx, 1 ; code de sortie
    int 0x80
