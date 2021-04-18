TITLE Ejercicio 8					(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data

aux DWORD ?
val DWORD 0
val2 DWORD 0

.code
main PROC
	call Clrscr

	mov ecx,16
	L1:
	  mov aux,ecx
	  mov ecx,val2
	  mov ecx,16

	  L2:

	  mov eax,val
	  call SetTextColor

	  mov al,'X'
	  call WriteChar

	  inc val

	  loop L2
	  call Crlf

	  mov ecx,aux

	  inc val2
	loop L1

	mov eax,white(black*16)
	call SetTextColor

	exit
main ENDP

END main