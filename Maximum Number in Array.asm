.model small
.stack 100h

.data
    arr dw 20h, 30h, 40h, 80h, 100h, 10h
    max_val dw 0

.code
main proc
    mov ax, @data
    mov ds, ax

    lea si, arr
    mov cx, 6
    mov ax, [si]
    dec cx
    add si, 2

find_max:
    mov bx, [si]
    cmp bx, ax
    jle skip
    mov ax, bx

skip:
    add si, 2
    loop find_max

    mov max_val, ax

    mov ah, 4ch
    int 21h
main endp
end main