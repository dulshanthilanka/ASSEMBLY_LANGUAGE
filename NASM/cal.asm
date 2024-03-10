section .data
    message db "ENTER THE FIRST NUMBER : ", 0
    message2 db "ENTER THE SECOND NUMBER : ", 0
    symbolmsg db "ENTER THE SYMBOL : ", 0

    num1 resb 255
    num2 resb 255
    sym resb 1

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, 255
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 255
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, symbolmsg
    mov edx, 255
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, sym
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, message2
    mov edx, 255
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 255
    int 0x80

    cmp byte [sym], '+'
    je addition
    cmp byte [sym], '/'
    je division
    cmp byte [sym], '-'
    je subtraction
    cmp byte [sym], '*'
    je multiplication

    mov eax, 1
    xor ebx, ebx
    int 0x80

addition:
    mov eax, [num1]
    add eax, [num2]

    mov eax, 4
    mov ebx, 1
    mov ecx, num1
    mov edx, 255
    int 0x80
    jmp exit

division:
    mov eax, [num1]
    xor edx, edx
    div dword [num2]

    mov eax, 4
    mov ebx, 1
    mov ecx, num1
    mov edx, 255
    int 0x80
    jmp exit

subtraction:
    mov eax, [num1]
    sub eax, [num2]

    mov eax, 4
    mov ebx, 1
    mov ecx, num1
    mov edx, 255
    int 0x80
    jmp exit

multiplication:
    mov eax, [num1]
    imul eax, dword [num2]

    mov eax, 4
    mov ebx, 1
    mov ecx, num1
    mov edx, 255
    int 0x80

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80
