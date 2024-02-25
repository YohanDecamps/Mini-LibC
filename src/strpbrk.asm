
BITS 64

section .text

; rdi = string
; rsi = accept

global strpbrk
    strpbrk:
        xor rax, rax
        mov rcx, -1

    .main_loop:
        inc rcx
        cmp byte [rdi + rcx], 0x0
        je .end_false
        mov rdx, 0
        jmp .loop

    .loop:
        cmp byte [rsi + rdx], 0x0
        je .main_loop
        mov r8b, byte [rdi + rcx]
        cmp r8b, byte [rsi + rdx]
        je .end_true
        inc rdx
        jmp .loop

    .end_true:
        mov r8, rdi
        add r8, rcx
        mov rax, r8
        ret

    .end_false:
        mov rax, 0x0
        ret

