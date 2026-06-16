;Youssef Eslam Hussein 231000070
.model small
.stack 100h

.data
    str1 db 'Computer Engineering$'
    str2 db 'computer engineering$'
    msg_match db 'They are matching.$'
    msg_no_match db "Don't match$"

.code
main proc
    mov ax, @data
    mov ds, ax

    lea si, str1
    lea di, str2

compare_loop:
    mov al, [si]
    mov bl, [di]
    
    cmp al, bl
    jne not_equal
    
    cmp al, '$'
    je equal
    
    inc si
    inc di
    jmp compare_loop

not_equal:
    lea dx, msg_no_match
    jmp print_msg

equal:
    lea dx, msg_match

print_msg:
    mov ah, 09h
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main