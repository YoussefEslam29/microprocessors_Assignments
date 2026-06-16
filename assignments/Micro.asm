; Name: [YOUSSEF ESLAM HUSSEIN]
; Registration Number: [231000070]

.model small
.stack 100h

.data
    Data1 DW 3FCAh
    Data2 DW 37D6h
    msg1 DB 'Number of 1''s in data1: $'
    msg2 DB 13, 10, 'Number of 0''s in data2: $'

.code
start:
    mov ax, @data
    mov ds, ax

    lea dx, msg1
    mov ah, 09h
    int 21h

    mov ax, Data1
    xor bx, bx
    mov cx, 16

l1:
    ror ax, 1
    jnc s1
    inc bx
s1:
    dec cx
    jnz l1

    mov ax, bx
    call print

    lea dx, msg2
    mov ah, 09h
    int 21h

    mov ax, Data2
    xor dx, dx
    mov cx, 16

l2:
    ror ax, 1
    jc s2
    inc dx
s2:
    dec cx
    jnz l2

    mov ax, dx
    call print

    mov ah, 4ch
    int 21h

print proc
    push ax
    push bx
    push cx
    push dx

    mov cx, 0
    mov bx, 10

d1:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne d1

p1:
    pop dx
    add dl, 30h
    mov ah, 02h
    int 21h
    dec cx
    jnz p1

    pop dx
    pop cx
    pop bx
    pop ax
    ret
print endp

end start