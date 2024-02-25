
BITS 64

section .text

; rdi = haystack
; rsi = needle

global strstr
    strstr:
        xor rax, rax
        mov rcx, -1
        mov r8, 0x0
        mov r9, 0x0
        mov r10, -1
        mov r11, rdi
        mov rdx, 0

    .test_empty:
        cmp byte [rdi], 0x0
        je .test_snd_empty
        jmp .loop_strlen

    .test_snd_empty:
        cmp byte [rsi], 0x0
        je .end_true
        jmp .loop_strlen

    .loop_strlen:
        cmp byte [rsi + rdx], 0x0
        je .main_loop
        inc rdx
        jmp .loop_strlen

    .main_loop:
        inc r10
        cmp byte [r11], 0x0
        je .end_false
        mov r11, rdi
        add r11, r10
        mov rcx, -1
        jmp .loop

    .loop:
        inc rcx
        cmp rdx, rcx
        jle .end_true
        cmp byte [r11 + rcx], 0x0
        je .end
        cmp byte [rsi + rcx], 0x0
        je .end
        mov r8b, byte [r11 + rcx]
        cmp byte [rsi + rcx], r8b
        je .loop
        jmp .end

    .end:
        mov r8b, byte [r11 + rcx]
        mov r9b, byte [rsi + rcx]
        cmp r8b, r9b
        je .end_true
        jmp .main_loop

    .end_true:
        mov rax, r11
        ret

    .end_false:
        mov rax, 0x0
        ret
