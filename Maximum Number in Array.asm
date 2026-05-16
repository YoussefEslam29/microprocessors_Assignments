;Youssef Eslam Hussein 231000070
.model small
.stack 100h

.data
    my_array dw 0020h, 0030h, 0040h, 0040h, 0080h, 0100h, 0010h
    msg db "Max value (Hex): $"

.code
start:
    mov ax, @data
    mov ds, ax

    lea si, my_array
    mov cx, 7
    mov ax, [si]
    dec cx
    add si, 2

find_max:
    mov bx, [si]
    cmp bx, ax
    jbe skip
    mov ax, bx

skip:
    add si, 2
    loop find_max

    push ax
    lea dx, msg
    mov ah, 09h
    int 21h
    pop ax

    mov cx, 4
    mov bx, ax

print_hex:
    rol bx, 4
    mov dl, bl
    and dl, 0Fh
    cmp dl, 9
    jbe print_digit
    add dl, 7

print_digit:
    add dl, 30h
    mov ah, 02h
    int 21h
    loop print_hex

    mov ah, 07h
    int 21h

    mov ah, 4ch
    int 21h
end start