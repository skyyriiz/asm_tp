section .data
    sum_msg db 'La somme est : ', 0

section .bss
    num1 resb 4
    num2 resb 4
    sum resb 4

section .text
    global _start

_start:
    ; récupérer le premier argument
    mov eax, [esp+4]
    add eax, 2
    mov ebx, eax
    mov eax, 3
    mov ecx, num1
    mov edx, 4
    int 0x80

    ; récupérer le deuxième argument
    add ebx, 2
    mov eax, 3
    mov ecx, num2
    mov edx, 4
    int 0x80

    ; convertir les arguments en entiers
    xor eax, eax
    xor ebx, ebx
    mov al, [num1]
    sub al, 48
    mov bl, [num2]
    sub bl, 48

    ; calculer la somme
    add eax, ebx

    ; convertir la somme en chaîne de caractères
    xor ebx, ebx
    mov bl, al
    mov ecx, sum
    mov edx, 1
    mov [ecx], bl
    mov eax, ecx
    sub eax, 2
    mov edx, 10
    div edx
    add dl, 48
    mov [eax], dl
    mov eax, 4
    mov ebx, 1
    mov ecx, sum_msg
    mov edx, 15
    int 0x80

    ; afficher la somme
    mov eax, 4
    mov ebx, 1
    mov ecx, sum
    mov edx, 4
    int 0x80

    ; quitter le programme avec un code de retour 0
    mov eax, 1
    xor ebx, ebx
    int 0x80
