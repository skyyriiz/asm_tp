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
    mov eax, 4        
    mov ebx, 1        
    mov ecx, message  
    mov edx, 18       
    int 0x80          
    
    ; lire l'entrée de l'utilisateur
    mov eax, 3        
    mov ebx, 0        
    mov ecx, num      
    mov edx, 2        
    int 0x80          
    
    ; convertir le nombre en entier
    mov eax, 0       
    mov al, [num]     
    sub al, 48        
    
    ; vérifier si le nombre est pair
    test al, 1        
    jz _even          
    
    ; si le nombre est impair
    mov eax, 4        
    mov ebx, 1        
    mov ecx, odd      
    mov edx, 21       
    int 0x80          
    
    ; retourner 1 pour indiquer que le nombre est impair
    mov eax, 1        
    mov ebx, 1  
    int 0x80          
    
_even:
    ; si le nombre est pair
    mov eax, 4        
    mov ebx, 1        
    mov ecx, even     
    mov edx, 19       
    int 0x80          
    
    ; retourner 0 pour indiquer que le nombre est pair
    mov eax, 0        
    mov ebx, 0        
    int 0x80         
    
    ; terminer le programme avec l'appel système "exit"
    mov eax, 1        
    xor ebx, ebx      
    int 0x80          
    
