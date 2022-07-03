; This is your structure
struc  my_date
    .day: resw 1
    .month: resw 1
    .year: resd 1
endstruc

section .text
    global ages

; void ages(int len, struct my_date* present, struct my_date* dates, int* all_ages);
ages:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; present
    mov     edi, [ebp + 16] ; dates
    mov     ecx, [ebp + 20] ; all_ages
    ;; DO NOT MODIFY

    ;; TODO: Implement ages
    ;; FREESTYLE STARTS HERE

    xor eax, eax ; i=0
    jmp start
loop:
    push edx

    mov DWORD edx, [edi + my_date_size * eax + my_date.year]
    mov [ecx + 4 * eax], DWORD edx                     ; all_ages[i] = dates[i].year

    mov DWORD edx, [esi + my_date.year]
    cmp [ecx + 4 * eax], DWORD edx
    jb continue
    mov DWORD [ecx + eax], 0
    jmp done

continue:
    sub edx, [ecx + 4 * eax]
    mov [ecx + 4 * eax], edx

    mov dx, [edi + my_date_size * eax + my_date.month]
    
    cmp dx, [esi + my_date.month] ; if(dates[i].month < present.month)
    jb done
    cmp dx, [esi + my_date.month]
    jne decrementation

; case where present.month == dates[i].month

    mov dx, [edi + my_date_size * eax + my_date.day]

    cmp dx, [esi + my_date.day] ; if(dates[i].day <= present.day)
    jbe done

decrementation:
    dec DWORD [ecx + 4 * eax]

done:
    pop edx
    inc eax ; i++

start:
    cmp     edx, eax
    jne     loop


    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
