section .text
	global ft_list_push_front
	extern malloc

ft_list_push_front:
	cmp rdi, 0
	je .error
	cmp rsi, 0
	je .error
	push rsi
	push rdi
	mov rdi, 16
	call malloc

.fill_lst:
	pop rdi
	mov rbx, [rdi]
	mov [rax + 8], rbx
	pop rsi
	mov [rax + 0], rsi
	mov [rdi], rax
	ret

.error:
	mov rax, 0
	ret