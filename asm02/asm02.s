global _start

section .data
    msg: db "Entrez la valeur: ",10,0
    format db "%d",0

section .bss
    x resb 4

section .text

_start:
    mov rdi, msg
    mov rax, 0

    mov rdi, format
    mov rsi, x
    mov rax, 0
    call scanf

    cmp rsi, rdi
    je ok
    jne end

ok:
    mov al, 1
    mov bl, 0
    int 0x80

end:
    mov al, 1
    mov bl, 1
    int 0x80