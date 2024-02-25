
BITS 64

section .text

global strchr
    strchr:
    xor rax, rax

    .loop:
        cmp byte [rdi], 0x0
        je .end_str
        cmp byte sil, [rdi]
        je .cmp_true
        inc rdi
        jmp .loop

    .end_str:
        cmp byte sil, 0x0
        je .cmp_true
        mov rax, 0x0
        ret

    .cmp_true:
        mov rax, rdi
        ret
