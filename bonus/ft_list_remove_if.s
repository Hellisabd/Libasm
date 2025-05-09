section .text
	global ft_list_remove_if
	extern free
	

ft_list_remove_if:
	cmp rsi, 0
	je .error
	cmp rdi, 0
	je .error
	cmp rdx, 0
	je .error
	cmp rcx, 0
	je .error
	mov r12, rdi
	mov r15, rsi
	mov r11, [r12]
	mov r13, rcx
	mov r14, rdx
	


.loop:
	cmp r11, 0
	je .done
	mov rdi, [r11]
	mov rsi, r15
	call r14
	cmp rax, 0
	je .equal
	mov r11, [r11 + 8]
	jmp .loop

.equal:
	cmp r11, [r12]
	je .head
	mov r9, [r12]
	jmp .search_prev

.search_prev:
	cmp [r9 + 8], r11
	je .no_head
	mov r9, [r9 + 8]
	jmp .search_prev

.no_head:
	mov rdi, [r11 + 8]
	mov [r9 + 8], rdi
	mov r9, [r11 + 8]
	mov rdi, [r11]
	push r11
	call r13
	pop r11
	mov rdi, r11
	call free
	mov r11, [r12]
	jmp .loop

.head:
	mov rdi, [r11]
	mov r10, [r11 + 8]
	mov [r12], r10
	push r11
	call r13
	pop r11
	mov rdi, r11
	call free
	mov r11, [r12]
	jmp .loop

.done:
	mov rax, 0
	ret

.error:
	ret