section .bss
	sign resb 1

section .text
	global ft_atoi_base
	extern ft_strlen

ft_atoi_base:
	mov byte [sign], 1
	xor r10, r10
	push rdi
	mov r9, rsi
	push rsi
	jmp .parsing_base

.parsing_base:
	pop rbx
	mov rdi, rsi
	call ft_strlen
	cmp rax, 1
	jle .wrong_length
	mov rdx, rax
	mov rdi, rbx
	cmp rbx, 0
	je .atoi_handling
	jmp .parsing_loop
	inc rbx
	jmp .parsing_base

.parsing_loop:
	inc rdi
	mov al, [rdi]
	cmp al, 0
	je .inc_rbx
	cmp al, [rbx]
	je .parsing_doublon
	cmp al, 43
	je .error_sign
	cmp al, 45
	je .error_sign
	cmp al, 32
	je .error_white
	cmp al, 9
	je .error_white
	cmp al, 10
	je .error_white
	cmp al, 11
	je .error_white
	cmp al, 12
	je .error_white
	cmp al, 13
	je .error_white
	jmp .parsing_loop

.inc_rbx:
	inc rbx
	mov al, [rbx]
	cmp al, 0
	je .atoi_handling
	mov rdi, rbx
	jmp .parsing_loop


.error_sign:
	pop rax
	mov rax, 0
	ret

.error_white:
	pop rax
	mov rax, 0
	ret

.wrong_length:
	pop rax
	mov rax, -0
	ret

.parsing_doublon:
	pop rax
	mov rax, 0
	ret

.atoi_handling:
	pop rdi
	mov rsi, r9
	mov rbx, rsi
	mov byte [sign], 1
	

.skip_white:
	mov al, [rdi]
	cmp al, 9
	jge .comp_white
	jmp .error_white

.comp_white:
	cmp al, 13
	jle .inc_rdi
	cmp al, 32
	je .inc_rdi
	jmp .skip_sign

.inc_rdi:
	inc rdi
	jmp .skip_white

.skip_sign:
	mov al, [rdi]
	cmp al, 43
	je .inc_rdi_sign_plus
	cmp al, 45
	je .inc_rdi_sign_minus
	jmp .atoi_loop

.inc_rdi_sign_minus:
	cmp byte [sign], 1
	je .negative
	jmp .positive

.inc_rdi_sign_plus:
	inc rdi
	jmp .skip_sign

.positive:
	mov byte [sign], 1
	inc rdi
	jmp .skip_sign

.negative:
	mov byte [sign], -1
	inc rdi
	jmp .skip_sign

.atoi_loop:
	mov al, [rdi]
	cmp al, 0
	je .done
	inc rdi
	jmp .find_number

.find_number:
	mov cl, [rbx]
	cmp cl, 0
	je .number_not_found
	cmp al, [rbx]
	je .number_found
	inc rbx
	jmp .find_number

.number_found:
	imul r10, rdx
	mov rax, rbx
	mov rbx, rsi
	sub rax, rsi
	add r10, rax
	jmp .atoi_loop

.number_not_found:
	movsx rbx, byte [sign]
	imul r10, rbx
	mov rax, r10
	ret


.done:
	movsx rbx, byte [sign]
	imul r10, rbx
	mov rax, r10
	ret

	