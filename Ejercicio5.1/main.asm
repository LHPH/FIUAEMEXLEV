TITLE Ejercicio1					(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
myMessage BYTE "cadena de colores",0dh,0ah,0
val1 DWORD 1
.code 
main PROC
	call Clrscr

	mov ecx,4
	L1:
	   
	   mov eax,val1
	   call SetTextColor

	   mov	 edx,OFFSET myMessage
	   call WriteString

	   inc val1

	loop L1
	exit
main ENDP

END main