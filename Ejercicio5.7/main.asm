TITLE Ejercicio 7					(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
myMessage BYTE "MASM program example",0dh,0ah,0
fila BYTE ?
col BYTE ?
fila2 DWORD ?
col2 DWORD ?

.code
main PROC
	call Clrscr

	   mov ecx,100
	   call GetMaxXY
	   mov fila,dh
	   mov col,dl

	 L1:
	   mov eax,40
	   call RandomRange

	   xchg fila2,eax

	   mov eax,40
	   call RandomRange

	   xchg col2,eax
	   
       mov dh, BYTE PTR fila2
	   mov dl, BYTE PTR col2
	   call Gotoxy

	   mov al,'x'
	   call WriteChar

	   mov eax,1000
	   call Delay

	   call Clrscr

	 loop L1
	
	exit
main ENDP

END main