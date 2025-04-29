section .text
	global ft_strcpy
	mov rax, 0

ft_strcpy: 
	cmp rsi, 0x0
	je .done
	mov al, [rsi]
	movzx rdi, al
	; inc rsi
	; inc rdi
	; inc rax
	; jmp .done

.done:
	; mov rdi, 0
	; sub rdi, rax
	mov rax, rdi
	ret