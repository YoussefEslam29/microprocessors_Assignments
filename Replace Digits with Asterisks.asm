.model small
.stack 100h

.data
    str db 'The password is 1122595$'

.code
main proc
    mov ax, @data
    mov ds, ax

    lea si, str

scan_loop:
    mov al, [si]
    cmp al, '$'
    je done_scan
    
    cmp al, '0'
    jb next_char
    cmp al, '9'
    ja next_char
    
    mov byte ptr [si], '*'

next_char:
    inc si
    jmp scan_loop

done_scan:
    lea dx, str
    mov ah, 09h
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main