.model small
.stack 100h

.data
title           db 13,10, '8086 MICROPROCESSOR BASICS DEMO', 13,10, '$'
line            db 13,10, '--------------------------------', 13,10, '$'

msgMove         db '1. Data transfer: AX gets value1, BX gets value2', 13,10, '$'
msgAdd          db '2. Addition result (value1 + value2) = $'
msgSub          db 13,10, '3. Subtraction result (value1 - value2) = $'
msgLogic        db 13,10, '4. Logic AND result (value1 AND 0Fh) = $'
msgCmpA         db 13,10, '5. Comparison: larger value = $'
msgArray        db 13,10, '6. Sum of array elements = $'
msgStack        db 13,10, '7. Stack demo: AX restored to = $'
msgProc         db 13,10, '8. Procedure demo: double of array sum = $'
msgEnd          db 13,10, 13,10, 'Program finished.', 13,10, '$'

value1          db 15
value2          db 6
maskValue       db 0Fh
numbers         db 2, 4, 6, 8, 10
count           equ 5

arraySum        dw 0
largerValue     db 0

.code
main proc
	mov ax, @data
	mov ds, ax

	lea dx, title
	call PrintString
	lea dx, line
	call PrintString

	; 1) Data transfer between memory and registers
	lea dx, msgMove
	call PrintString
	mov al, value1
	mov bl, value2

	; 2) Arithmetic: addition
	mov al, value1
	mov bl, value2
	add al, bl
	xor ah, ah
	lea dx, msgAdd
	call PrintString
	call PrintNum

	; 3) Arithmetic: subtraction
	mov al, value1
	mov bl, value2
	sub al, bl
	xor ah, ah
	lea dx, msgSub
	call PrintString
	call PrintNum

	; 4) Logic instruction
	mov al, value1
	and al, maskValue
	xor ah, ah
	lea dx, msgLogic
	call PrintString
	call PrintNum

	; 5) Comparison and conditional jump
	mov al, value1
	mov bl, value2
	cmp al, bl
	ja  Value1IsLarger
	mov largerValue, bl
	jmp ShowLarger

Value1IsLarger:
	mov largerValue, al

ShowLarger:
	xor ax, ax
	mov al, largerValue
	lea dx, msgCmpA
	call PrintString
	call PrintNum

	; 6) Loop through an array and calculate the sum
	xor ax, ax
	xor bx, bx
	lea si, numbers
	mov cx, count

SumLoop:
	mov bl, [si]
	add ax, bx
	inc si
	loop SumLoop

	mov arraySum, ax
	lea dx, msgArray
	call PrintString
	call PrintNum

	; 7) Stack usage with PUSH and POP
	mov ax, 1234h
	push ax
	xor ax, ax
	pop ax
	lea dx, msgStack
	call PrintString
	call PrintHex16

	; 8) Procedure call: double the array sum
	mov ax, arraySum
	call DoubleAX
	lea dx, msgProc
	call PrintString
	call PrintNum

	lea dx, msgEnd
	call PrintString

	mov ax, 4C00h
	int 21h
main endp

PrintString proc
	mov ah, 09h
	int 21h
	ret
PrintString endp

PrintNum proc
	push ax
	push bx
	push cx
	push dx

	cmp ax, 0
	jne ConvertNumber

	mov dl, '0'
	mov ah, 02h
	int 21h
	jmp PrintNumDone

ConvertNumber:
	xor cx, cx
	mov bx, 10

DivideLoop:
	xor dx, dx
	div bx
	push dx
	inc cx
	cmp ax, 0
	jne DivideLoop

PrintDigits:
	pop dx
	add dl, '0'
	mov ah, 02h
	int 21h
	loop PrintDigits

PrintNumDone:
	pop dx
	pop cx
	pop bx
	pop ax
	ret
PrintNum endp

PrintHex16 proc
	push ax
	push bx
	push cx
	push dx

	mov bx, ax
	mov cx, 4

HexLoop:
	rol bx, 4
	mov dl, bl
	and dl, 0Fh
	cmp dl, 9
	jbe HexDigit
	add dl, 7

HexDigit:
	add dl, '0'
	mov ah, 02h
	int 21h
	loop HexLoop

	pop dx
	pop cx
	pop bx
	pop ax
	ret
PrintHex16 endp

DoubleAX proc
	add ax, ax
	ret
DoubleAX endp

end main
