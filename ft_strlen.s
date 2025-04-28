section .bss
	count resd 1

section .text
	global ft_strlen

ft_strlen:
	mov rsi, rdi
	mov qword [count], 0

.loop:
	mov al, [rsi]
	cmp al, 0
	je .print
	inc qword [count]
	inc rsi
	jmp .loop

.done:
	mov rax, [count]
	ret

.print:
	mov rax, 1
	mov rdi, 1
	sub rsi, [count]
	mov rdx, [count]
	syscall
	jmp .done
