section .data
    extern len_cheie, len_haystack

section .text
    global columnar_transposition


;; void columnar_transposition(int key[], char *haystack, char *ciphertext);
columnar_transposition:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha 

    mov edi, [ebp + 8]   ;key
    mov esi, [ebp + 12]  ;haystack
    mov ebx, [ebp + 16]  ;ciphertext
    ;; DO NOT MODIFY

    ;; TODO: Implment columnar_transposition
    ;; FREESTYLE STARTS HERE

    xor eax, eax ; contor for key
    xor ecx, ecx ; contor for ciphertext
loop_key:

    xor edx, edx ; contor for haystack
    mov edx, [edi + 4 * eax] ; key[i]

loop_haytext:

    push eax
    mov al, BYTE [esi + edx]
    mov BYTE [ebx + ecx], al
    pop eax

    inc ecx

    add edx, [len_cheie]
    cmp edx, [len_haystack]
    jb loop_haytext

    inc eax
    cmp eax, [len_cheie]
    jne loop_key

    

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY