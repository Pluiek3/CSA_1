.686
.model flat, stdcall
option casemap: none
include windows.inc
include kernel32.inc
include msvcrt.inc
includelib kernel32.lib
includelib msvcrt.lib

.DATA
	printf DB 13, 10, "Result: %d", 0
	a DW 5
	b DD 60
	r DD ?
	dqq DQ 171.233
.CODE
START:
	XOR EAX, EAX	     	
	MOV AX, a	      
	MOV EBX, b
	ADD EAX, EBX
	MOV r, EAX
	
        ; --- Вывод результата ---
        push r                ; второй аргумент: значение r
        push offset printf    ; первый аргумент: адрес строки формата
        call crt_printf       ; вызов printf("Result: %d", r)
        add esp, 8            ; очистка стека (2 аргумента по 4 байта)

        ; --- Задержка, чтобы увидеть результат ---
        call crt__getch       ; ожидание нажатия клавиши (getch)

        push 0
        call ExitProcess  
END START
