
BITS 64

section .text

; rdi = dest
; rsi = src
; rdx = copied size

global memcpy
    memcpy:
        xor rax, rax

    .loop:
        cmp rdx, 0x0
        je .end
        mov r8b, byte [rsi + rdx - 1]
        mov byte [rdi + rdx - 1], r8b
        sub rdx, 1
        jmp .loop

    .end:
        mov rax, rdi
        ret

