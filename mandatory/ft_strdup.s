extern malloc
extern ft_strlen

section .text
	global ft_strdup

ft_strdup:
	push rdi
	call ft_strlen
	mov rcx, rax
	inc rcx
	mov rdi, rcx
	call malloc
	pop rsi
	cmp rax, 0
	je .error
	push rax

.loop:
	mov bl, [rsi]
	mov [rax], bl
	cmp bl, 0
	je .done
	inc rax
	inc rsi
	jmp .loop

.done:
	pop rax
	ret

.error:
	ret
	