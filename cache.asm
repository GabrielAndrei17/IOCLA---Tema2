;; defining constants, you can use these as immediate values in your code
CACHE_LINES  EQU 100
CACHE_LINE_SIZE EQU 8
OFFSET_BITS  EQU 3
TAG_BITS EQU 29 ; 32 - OFSSET_BITS


section .text
    global load


;; void load(char* reg, char** tags, char cache[CACHE_LINES][CACHE_LINE_SIZE], char* address, int to_replace);
load:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; address of reg
    mov ebx, [ebp + 12] ; tags
    mov ecx, [ebp + 16] ; cache
    mov edx, [ebp + 20] ; address
    mov edi, [ebp + 24] ; to_replace (index of the cache line that needs to be replaced in case of a cache MISS)
    ;; DO NOT MODIFY

    ;; TODO: Implment load
    ;; FREESTYLE STARTS HERE
    sub esp, 4 ; offest-ul


    mov DWORD [ebp - 4], 7
    and [ebp - 4], edx

    shr DWORD edx, 3 ; edx = tagul


    xor esi, esi

loop_tags:

    cmp [ebx + esi], edx
    je cache_found

    add esi, 4
    cmp esi, CACHE_LINES
    jne loop_tags    
cache_miss:
    mov [ebx + edi * 4], edx ; se adauga tagul in tags[to_replace]
    
    xor esi, esi
    push eax
    xor eax, eax
    shl edx, 3

loop_cache:
    mov eax, edx
    add eax, esi ; octetul care trebuie adaugat la pasul i
    mov eax, [eax]

    mov [ecx + edi * CACHE_LINE_SIZE], eax ; se adauga octetul in cache


    inc esi
    inc ecx
    cmp esi, 8
    jne loop_cache

    sub ecx, 7
    pop eax

    mov esi, edi


cache_found:

    xor edx, edx

    mov edx, ecx
    add edx, [ebp - 4]

    mov dx, [edx + esi * CACHE_LINE_SIZE - 1]

    mov [eax], dx

    add esp, 4
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY


