TITLE Ejercicio9					(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data

VERDADERO=1
FALSO=0

promedioCalif DWORD ?
creditos DWORD ?
val SDWORD ?
msg1 BYTE "Dame Promedio ",0dh,0ah,0
msg2 BYTE "Dame Creditos ",0dh,0ah,0
error BYTE "Fuera del Rango ",0
msg3 BYTE "El Alumno se Puede Registrar",0
msg4 BYTE "El Alumeno no se puede registrar",0
msg5 BYTE "Continuar 1-SI, 0-NO ",0
registrar BYTE ?
.code
main PROC
  call Clrscr
Ciclo:
  call ComprobarPromedio
  cmp ebx,0
  je quitar

  call ComprobarCreditos
  cmp ebx,0
  je quitar

  call ComprobarInscripcion
  mov al,0
  cmp al,registrar
  je M1
  jmp M2

  M1:
    mov edx,OFFSET msg4
    call WriteString
    call Crlf
	jmp B0

  M2:
     mov edx,OFFSET msg3
    call WriteString
	call Crlf
	jmp B0
    
  call Crlf

  B0:
  mov edx,OFFSET msg5
  call WriteString

  call ReadInt
  mov val,eax
  call Crlf

  mov eax,0
  cmp eax,val
 
  je quitar
  jmp B


  B:
    jmp ciclo
  
quitar:
   
exit
main ENDP


ComprobarPromedio PROC

repetir:
  mov edx,OFFSET msg1
  call WriteString

  call ReadDec
  mov promedioCalif,eax

  mov eax,0
  cmp eax,promedioCalif
  je salida1 

  mov eax,0
  cmp eax,promedioCalif
  jb A1
  jmp A2

  A1:
    mov eax,100
	cmp eax,promedioCalif
	jae A11
	jmp A2

  A11:
	 jmp salida

  A2:
      mov edx,OFFSET error
      call WriteString
	  call Crlf
	  jmp repetir

  salida1:
     mov ebx,0
     jmp salida

   salida:
   ret
ComprobarPromedio ENDP

ComprobarCreditos PROC

repetir:
  mov edx,OFFSET msg2
  call WriteString

  call ReadDec
  mov creditos,eax

  mov eax,0
  cmp eax,creditos
  je salida1 

  mov eax,1
  cmp eax,creditos
  jb A1
  jmp A2

  A1:
    mov eax,30
	cmp eax,creditos
	jae A11
	jmp A2

  A11:
	 jmp salida

  A2:
      mov edx,OFFSET error
      call WriteString
	  call Crlf
	  jmp repetir

  salida1:
     mov ebx,0
     jmp salida

   salida:
   ret
ComprobarCreditos ENDP
 
ComprobarInscripcion PROC

  mov registrar,FALSO

  mov eax,350
  cmp eax,promedioCalif
  ja A1
  jmp A2

  A1:
    mov registrar,VERDADERO
	jmp salida

  A2:
    mov eax,250
	cmp eax,promedioCalif
	jb A3
	jmp A4

  A3:
    mov eax,16
	cmp eax,creditos
	jae AF
	jmp A4

  AF:
    mov registrar,VERDADERO
	jmp salida

  A4:
    mov eax,12
	cmp eax,creditos
	jae AF
	jmp AF2

  AF2:
    mov registrar,FALSO
	jmp salida
salida:
ret
ComprobarInscripcion ENDP   


END main