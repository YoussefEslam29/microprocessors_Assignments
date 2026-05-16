;Youssef Eslam Hussein 231000070
.model small
.stack 100h

.data
    str db 'Arab Academy for Science and Technology$'
    vowels db 'aAeEiIoOuU'
    vowel_count db 0

.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax

    lea si, str
    mov bl, 0

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
    mov vowel_count, bl

    mov ah, 4ch
    int 21h
main endp
end main