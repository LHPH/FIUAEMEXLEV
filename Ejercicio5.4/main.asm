TITLE Ejercicio 4					(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
linea1 BYTE "Dame Numero 1: ",0
linea2 BYTE "Dame Numero 2: ",0
linea3 BYTE "El Resultado es: ",0
val1 SDWORD ?
val2 SDWORD ?
val3 SDWORD ?

.code
main PROC
	call Clrscr

	mov ecx,3
	L1:
	call Clrscr

	 mov dh,9
	 mov dl,23
	 call Gotoxy

	 mov  edx,OFFSET linea1
	 call WriteString

	 call ReadInt
	 mov val1,eax

	 call Clrscr

	  mov dh,9
	 mov dl,23
	 call Gotoxy

	 mov edx,OFFSET linea2
	 call WriteString

	 call ReadInt
	 mov val2,eax

	 call Clrscr

	  mov dh,9
	 mov dl,23
	 call Gotoxy

	 mov edx,OFFSET linea3
	 call WriteString

	 mov ebx,val2
	 add ebx,val1

	 mov eax,ebx
	 call WriteInt

	 mov eax,1000
	 call Delay

	 loop L1

	  mov dh,9
	 mov dl,23
	 call Gotoxy

	exit
main ENDP

END main