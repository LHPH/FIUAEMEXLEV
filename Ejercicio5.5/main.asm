TITLE Ejercicio 6					(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data

.code
main PROC
	call Clrscr
     
	 mov ecx,50

	 L1:
	   mov eax,41
	   call RandomRange
	   sub eax,20

	   mov eax,eax
	   call WriteInt

	   call Crlf

	 loop L1

	exit
main ENDP

END main