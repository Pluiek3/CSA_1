.686
.model flat, stdcall
option casemap: none
include windows.inc
include kernel32.inc
include msvcrt.inc
includelib kernel32.lib
includelib msvcrt.lib

.DATA
    printf DB 13, 10, "Result: %d", 0   ; CR, LF, строка формата для printf
    a      DW 5                         ; a = 5 (2 байта)
    b      DD 60                        ; b = 60 (4 байта)
    r      DD ?                         ; r — результат (4 байта)
    dqq    DQ 171.233                   ; dqq = 171.233 (8 байт, double)

.CODE
START:
    XOR EAX, EAX                        ; EAX = 0
    MOV AX, a                           ; AX = 5 (a — слово)
    MOV EBX, b                          ; EBX = 60
    ADD EAX, EBX                        ; EAX = 5 + 60 = 65
    MOV r, EAX                          ; r = 65

    ; Вывод результата
    push r                              ; второй аргумент: значение r
    push offset printf                  ; первый аргумент: адрес строки формата
    call crt_printf                     ; вызов printf("Result: %d", r)
    add esp, 8                          ; очистка стека (2 аргумента по 4 байта)

    ; Задержка, чтобы увидеть результат
    call crt__getch                     ; ожидание нажатия клавиши (getch)

    ;Завершение программы 
    push 0
    call ExitProcess
END START
