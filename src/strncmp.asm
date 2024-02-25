
BITS 64

section .text

; rdi = first string
; rsi = second string
; rdx = max size

global strncmp
    strncmp:
        xor rax, rax
        mov rcx, -1
        mov r8, 0x0
        mov r9, 0x0

    .loop:
        inc rcx
        cmp rdx, rcx
        jle .end_true
        cmp byte [rdi + rcx], 0x0
        je .end
        cmp byte [rsi + rcx], 0x0
        je .end
        mov r8b, byte [rdi + rcx]
        cmp byte [rsi + rcx], r8b
        je .loop
        jmp .end

    .end:
        mov r8b, byte [rdi + rcx]
        mov r9b, byte [rsi + rcx]
        cmp r8b, r9b
        je .end_true
        jmp .end_false

    .end_true:
        mov rax, 0
        ret

    .end_false:
        sub r8, r9
        mov rax, r8
        ret
