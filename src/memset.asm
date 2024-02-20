
BITS 64                             ; architecture 64

section .text                       ; coding section

global memset                       ; definition of memset function
    memset:
        xor rax, rax

    .loop:
        cmp rdx, 0x0
        je .end
        mov byte [rdi + rdx - 1], sil
        sub rdx, 1
        jmp .loop

    .end:
        mov rax, rdi
        ret

