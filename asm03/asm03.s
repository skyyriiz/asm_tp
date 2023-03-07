global _start

section .data
    message_correct db "Bravo, vous avez entré 42!", 10 ; Message à afficher si l'utilisateur entre '42'
    message_error db "La chaîne entrée n'est pas '42'", 10 ; Message à afficher si l'utilisateur n'entre pas '42'

section .text

_start:
    add rsp, 8 ; Ignorer les deux premiers arguments qui sont inutiles ici

    mov rdi, qword [rsp] ; Mettre le pointeur de chaîne dans RDI pour le manipuler plus facilement

    mov bl, byte [rdi] ; Récupérer le premier caractère
    cmp bl, 0x34 ; Vérifier qu'il s'agit bien du caractère '4'
    jne _end_error ; Si ce n'est pas le cas, sauter à la fin de programme avec une erreur

    mov bl, byte [rdi + 1] ; Récupérer le deuxième caractère
    cmp bl, 0x32 ; Vérifier qu'il s'agit bien du caractère '2'
    jne _end_error ; Si ce n'est pas le cas, sauter à la fin de programme avec une erreur

    mov bl, byte [rdi + 2] ; Récupérer le troisième caractère
    cmp bl, 0 ; Vérifier qu'il s'agit bien d'un caractère nul de fin de chaîne
    jne _end_error ; Si ce n'est pas le cas, sauter à la fin de programme avec une erreur

    cmp dword [rdi], 0x343200 ; Vérifier que la chaîne entière correspond à '42' (en utilisant une comparaison dword pour plus de simplicité)
    jne _end_error ; Si ce n'est pas le cas, sauter à la fin de programme avec une erreur

    ; Si on arrive ici, la chaîne entrée est bien '42'
    mov eax, 4 ; Afficher un message de confirmation
    mov ebx, 1
    mov ecx, message_correct
    mov edx, 27
    int 0x80

_end:
    mov eax, 1 ; Quitter le programme avec le code de sortie 0
    mov ebx, 0
    int 0x80

_end_error:
    mov eax, 4 ; Afficher un message d'erreur
    mov ebx, 1
    mov ecx, message_error
    mov edx, 34
    int 0x80
    
    mov eax, 1 ; Quitter le programme avec le code de sortie 1
    mov ebx, 1
    int 0x80

