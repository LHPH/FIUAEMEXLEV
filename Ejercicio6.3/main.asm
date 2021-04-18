TITLE Ejercicio 3					(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc

.data

val SDWORD ?
msg  BYTE "Dame Calificacion",0dh,0ah,0
msg1 BYTE "A",0
msg2 BYTE "B",0
msg3 BYTE "C",0
msg4 BYTE "D",0
msg5 BYTE "F",0
error BYTE "Fuera del Rango",0
.code
main PROC
	call Clrscr

	mov edx,OFFSET msg
	call WriteString
	
	call ReadInt
	mov val,eax

	mov eax,100
	cmp eax,val
	jl salida2

	mov eax,0
	cmp eax,val
	jg salida2


	mov eax,90
	cmp eax,val
	jle A

	mov eax,80
	cmp eax,val
	jle B

	mov ebx,70
	cmp ebx,val
	jle C1

	mov ebx,60
	cmp ebx,val
	jle D

	mov ebx,59
	cmp ebx,val
	jge E

	A:
	  mov edx, OFFSET msg1
	  call WriteString
	jmp salida

	B:
	  mov edx, OFFSET msg2
	  call WriteString
	jmp salida

	C1:
	  mov edx, OFFSET msg3
	  call WriteString
	jmp salida

	D:
	  mov edx, OFFSET msg4
	  call WriteString
	jmp salida

	E:
	  mov edx, OFFSET msg5
	  call WriteString
	jmp salida

	salida2:
	  mov edx,OFFSET error
	  call WriteString
	  jmp salida

	salida:
	call Crlf
	exit
main ENDP

END main