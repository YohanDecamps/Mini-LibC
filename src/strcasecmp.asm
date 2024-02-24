
BITS 64

section .text

; rdi = first string
; rsi = second string

global strcasecmp
    strcasecmp:
        xor rax, rax
        mov rcx, -1
        mov r8, 0x0
        mov r9, 0x0

    .loop:
        inc rcx
        cmp byte [rdi + rcx], 0x0
        je .end
        cmp byte [rsi + rcx], 0x0
        je .end
        mov r8b, byte [rdi + rcx]
        cmp byte [rsi + rcx], r8b
        je .loop
        jmp .fst_str_fst_case_test

    .fst_str_fst_case_test:
        mov r8b, byte [rdi + rcx]
        mov r9b, byte [rsi + rcx]
        cmp r8b, 'A'
        jge .fst_str_snd_case_test
        jmp .snd_str_fst_case_test

    .fst_str_snd_case_test:
        cmp r8b, 'Z'
        jg .snd_str_fst_case_test
        add r8b, 32
        jmp .snd_str_fst_case_test

    .snd_str_fst_case_test:
        cmp r9b, 'A'
        jge .snd_str_snd_case_test
        jmp .cmp_after_case_change

    .snd_str_snd_case_test:
        cmp r9b, 'Z'
        jg .cmp_after_case_change
        add r9b, 32
        jmp .cmp_after_case_change

    .cmp_after_case_change:
        cmp r8b, r9b
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
