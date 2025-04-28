section .data
	msg db "Hello World!", 10
	len equ $ - msg

section .text
	global hello

hello:
	mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall 

    ret
