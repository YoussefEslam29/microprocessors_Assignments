;Youssef Eslam Hussein 231000070
.model small
.stack 100h

.model small
.stack 100h

.data
    mystring db 'Arab Academy for Science and Technology$'
    vowels db 'aAeEiIoOuU'
    msg db 'Total vowels found: $'

.code
main proc
    mov ax, @data
    mov ds, ax

    lea si, mystring
    xor bx, bx

next_char:
    mov al, [si]
    cmp al, '$'
    je done

    lea di, vowels
    mov cx, 10

check_vowel:
    mov ah, [di]
    cmp al, ah
    je is_vowel
    inc di
    loop check_vowel
    jmp not_vowel

is_vowel:
    inc bl

not_vowel:
    inc si
    jmp next_char

done:
    lea dx, msg
    mov ah, 09h
    int 21h

    mov al, bl
    xor ah, ah
    
    mov cl, 10
    div cl
    
    mov bx, ax
    
    mov dl, bl
    add dl, 30h
    mov ah, 02h
    int 21h
    
    mov dl, bh
    add dl, 30h
    mov ah, 02h
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main