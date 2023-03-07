section .data
    message db 'Entrez un nombre : ', 0
    even db 'Le nombre est pair', 0
    odd db 'Le nombre est impair', 0
    
section .bss
    num resb 2
    
section .text
    global _start
    
_start:
    ; afficher le message "Entrez un nombre : "
    mov eax, 4        ; appel système "write"
    mov ebx, 1        ; sortie standard
    mov ecx, message  ; pointeur vers le message
    mov edx, 18       ; longueur du message
    int 0x80          ; exécuter l'appel système
    
    ; lire l'entrée de l'utilisateur
    mov eax, 3        ; appel système "read"
    mov ebx, 0        ; entrée standard
    mov ecx, num      ; pointeur vers la zone de stockage de l'entrée
    mov edx, 2        ; longueur maximale de l'entrée
    int 0x80          ; exécuter l'appel système
    
    ; convertir le nombre en entier
    mov eax, 0        ; effacer EAX pour le stockage de la valeur convertie
    mov al, [num]     ; charger le premier caractère de l'entrée dans AL
    sub al, 48        ; convertir le caractère ASCII en entier décimal
    
    ; vérifier si le nombre est pair
    test al, 1        ; tester si le bit de poids faible est défini (nombre impair)
    jz _even          ; sauter à l'étiquette "_even" si le nombre est pair
    
    ; si le nombre est impair
    mov eax, 4        ; appel système "write"
    mov ebx, 1        ; sortie standard
    mov ecx, odd      ; pointeur vers le message d'impairité
    mov edx, 21       ; longueur du message
    int 0x80          ; exécuter l'appel système
    
    ; retourner 1 pour indiquer que le nombre est impair
    mov eax, 1        ; charger la valeur de sortie 1 dans EAX
    mov ebx, 0        ; pas de code d'erreur
    int 0x80          ; exécuter l'appel système "exit"
    
_even:
    ; si le nombre est pair
    mov eax, 4        ; appel système "write"
    mov ebx, 1        ; sortie standard
    mov ecx, even     ; pointeur vers le message de parité
    mov edx, 19       ; longueur du message
    int 0x80          ; exécuter l'appel système
    
    ; retourner 0 pour indiquer que le nombre est pair
    mov eax, 0        ; charger la valeur de sortie 0 dans EAX
    mov ebx, 0        ; pas de code d'erreur
    int 0x80          ; exécuter l'appel système "exit"
    
    ; terminer le programme avec l'appel système "exit"
    mov eax, 1        ; charger l'appel système "exit" dans EAX
    xor ebx, ebx      ; passer 0 comme code de sortie
    int 0x80          ; exécuter l'appel système
