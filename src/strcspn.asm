
BITS 64

section .text

; rdi = string
; rsi = reject

global strcspn
    strcspn:
        xor rax, rax
        mov rcx, -1

    .main_loop:
        inc rcx
        cmp byte [rdi + rcx], 0x0
        je .end
        mov rdx, 0
        jmp .loop

    .loop:
        cmp byte [rsi + rdx], 0x0
        je .main_loop
        mov r8b, byte [rdi + rcx]
        cmp r8b, byte [rsi + rdx]
        je .end
        inc rdx
        jmp .loop

    .end:
        mov rax, rcx
        ret

