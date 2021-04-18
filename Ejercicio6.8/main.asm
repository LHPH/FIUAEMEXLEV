TITLE Ejercicio 8				(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
 linea1 BYTE "Menu de Opciones",0dh,0ah
        BYTE "1-x AND y",0dh,0ah
		BYTE "2-x OR y",0dh,0ah
		BYTE "3-NOT x",0dh,0ah
		BYTE "4-x XOR y",0dh,0ah,0

 opc DWORD ?
 val SDWORD ?
 val2 SDWORD ?
 res SDWORD ?
 msg1 BYTE "Dame Un Numero Hexadecimal ",0
 msg2 BYTE "Dame Otro Numero Hexadecimal ",0 
 msg3 BYTE "El Resultado De La Operacion es ",0

.code
main PROC
    call Clrscr

	mov edx,OFFSET linea1
	call WriteString

	call ReadDec
	mov opc,eax

	mov eax,1
	cmp eax,opc
	je OPC1

	mov eax,2
	cmp eax,opc
	je OPC2

	mov eax,3
	cmp eax,opc
	je OPC3

	mov eax,4
	cmp eax,opc
	je OPC4
	jmp salida

	OPC1:
	   call AND_op
	   jmp salida

	OPC2:
	   call OR_op
	   jmp salida

	OPC3:
	   call NOT_op
	   jmp salida

	OPC4:
	   call XOR_op
	   jmp salida

	salida:
	exit
main ENDP

AND_op PROC
  
  mov edx,OFFSET msg1
  call WriteString

  call ReadHex
  mov val,eax

  mov edx,OFFSET msg2
  call WriteString

  call ReadHex
  mov val2,eax

  mov eax,val2

  AND eax,val

  mov edx,OFFSET msg3
  call WriteString

  ;mov eax,val2
  call WriteHex
  call Crlf

ret
AND_op ENDP

OR_op PROC
  mov edx,OFFSET msg1
  call WriteString

  call ReadHex
  mov val,eax

  mov edx,OFFSET msg2
  call WriteString

  call ReadHex
  mov val2,eax

  mov eax,val2

  OR eax,val

   mov edx,OFFSET msg3
  call WriteString


  ;mov eax,val
  call WriteHex
   call Crlf

ret

OR_op ENDP

NOT_op PROC

 mov edx,OFFSET msg1
  call WriteString

  call ReadHex
  mov val,eax

  NOT val

   mov edx,OFFSET msg3
  call WriteString


  mov eax,val
  call WriteHex
   call Crlf

ret

NOT_op ENDP

XOR_op PROC

 mov edx,OFFSET msg1
  call WriteString

  call ReadHex
  mov val,eax

  mov edx,OFFSET msg2
  call WriteString

  call ReadHex
  mov val2,eax

  mov eax,val2

  XOR eax,val

   mov edx,OFFSET msg3
  call WriteString


  ;mov eax,val2
  call WriteHex
   call Crlf

ret

XOR_op ENDP

END main