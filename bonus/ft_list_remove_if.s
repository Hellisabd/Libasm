section .text
	global ft_list_remove_if
	extern free
	

ft_list_remove_if:
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
	jmp .search_prev

.search_prev:
	mov r9, [r12]
	cmp [r9 + 8], r11
	je .no_head
	mov r9, [r9 + 8]

.no_head:
	mov r9, [r11 + 8]
	mov rdi, [r11]
	call r13
	mov rdi, r11
	call free
	mov r11, r9
	jmp .loop

.head:
	mov rdi, [r11]
	mov r10, [r11 + 8]
	mov [r12], rdx
	call r13
	mov r11, r10
	jmp .loop

.done:
	mov rax, 0
	ret