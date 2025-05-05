section .text
	global ft_strcpy

ft_strcpy: 
	push rsi
	push rdi

.loop:
	mov al, [rsi]
	mov [rdi], al
	cmp al, 0x0
	je .done
	inc rdi
	inc rsi
	jmp .loop

.done:
	pop rdi
	pop rsi
	mov rax, rdi
	ret