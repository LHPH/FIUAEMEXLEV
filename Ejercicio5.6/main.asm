TITLE Ejercicio 5					(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
myMessage BYTE "MASM program example",0dh,0ah,0

val DWORD ?
aux DWORD ?
aux2 DWORD ?
.code
main PROC
	call Clrscr

	mov ecx,20
	L2:
	xchg aux,ecx

	  mov ecx,10
     	L1:

	     mov eax,26
	     call RandomRange
	     add eax,65

      	xchg val,eax

     	mov al, BYTE PTR val
	    call WriteChar

	    loop L1
		call Crlf

      mov ecx,aux
	  loop L2

	call Crlf

	exit
main ENDP

END main