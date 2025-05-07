section .text
	global ft_list_sort

ft_list_sort:
	mov r12, rdi
	mov r9, [rdi]
	mov r10, rsi

.init:
	mov r9, [r12]
	mov r8, rdi
	mov rdx, [r12]
	mov rdx, [rdx + 8]
	cmp rdx, 0
	je .done
	mov rcx, rdx
	mov rcx, [rcx + 8]

.initloop:
	cmp rdx, 0
	je .done
	mov rdi, [r9 + 0]
	mov rsi, [rdx + 0]
	call r10
	cmp rax, 0
	jg .swap_head

.loop:
	cmp rcx, 0
	je .done
	mov rdi, [rdx + 0] 
	mov rsi, [rcx + 0] 
	call r10
	cmp rax, 0
	jg .swap
	mov rdx, [rdx + 8]
	mov rcx, [rcx + 8]
	mov r9, [r9 + 8]
	jmp .loop

.swap:
	mov r11, [rcx + 8]
	mov [r9 + 8], rcx
	mov [rdx + 8], r11
	mov [rcx + 8], rdx
	jmp .init

.swap_head:
	mov r11, [rdx + 8]
	mov [r9 + 8], r11
	mov [rdx + 8], r9
	mov [r12], rdx
	jmp .init

.done:
	mov rax, 0
	ret