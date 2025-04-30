section .text
	global ft_strcmp

ft_strcmp:
	push rdi
	push rsi
	xor rax, rax

.loop:
	mov al, [rdi]
	sub al, [rsi]
	cmp al, 0
	jne .done
	mov al, [rdi]
	cmp al, 0
	je .done
	inc rdi
	inc rsi
	jmp .loop


.done:
	pop rsi
	pop rdi
	movsx rax, al
	ret