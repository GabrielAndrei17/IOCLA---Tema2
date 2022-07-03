section .text
    global rotp

;; void rotp(char *ciphertext, char *plaintext, char *key, int len);
rotp:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]  ; ciphertext
    mov     esi, [ebp + 12] ; plaintext
    mov     edi, [ebp + 16] ; key
    mov     ecx, [ebp + 20] ; len
    ;; DO NOT MODIFY

    ;; TODO: Implment rotp
    ;; FREESTYLE STARTS HERE

    mov eax, DWORD ecx
    sub eax, 1
    add DWORD edi, eax ; key = key + len - 1
    jmp start


loop:
    mov eax, DWORD esi
    movzx ebx, BYTE [eax] ; ebx = plaintext[0]
    mov eax, DWORD edi
    movzx eax, BYTE [eax] ; eax = key[0]
    xor ebx, eax

    mov [edx], bx

    dec ecx
    dec edi
    inc esi
    inc edx
start:
    cmp DWORD ecx, 0
    jne loop

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY