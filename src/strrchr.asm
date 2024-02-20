
BITS 64

section .text

global strrchr
    strrchr:
    xor rax, rax

    .endloop:
        cmp byte [rdi + rax], 0x0
        je .loop
        inc rax
        jmp .endloop

    .loop:
        cmp byte [rdi + rax], sil
        je .cmp_true
        cmp byte [rdi], 0x0
        je .end_str
        sub rax, 1
        jmp .loop

    .end_str:
        mov rax, 0x0
        ret

    .cmp_true:
        add rdi, rax
        mov rax, rdi
        ret
