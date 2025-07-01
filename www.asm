assume cs:code, ds:data

data segment
    db 'welcome to masm!'
data ends

code segment
start:
    ; 1. 初始化数据段
    mov ax, data
    mov ds, ax

    ; 2. 初始化显存段
    mov ax, 0b800h
    mov es, ax

    ; 3. 输出 "welcome"（7个字符，属性0x02）
    mov si, 0          ; 数据段偏移
    mov di, 0          ; 显存偏移
    mov cx, 7
    mov ah, 02h       ; 属性字节
print_welcome:
    mov al, [si]
    mov es:[di], al
    mov es:[di+1], ah
    inc si
    add di, 2
    loop print_welcome

    ; 4. 输出 "to"（2个字符，属性0x24）
    mov cx, 2
    mov ah, 24h
print_to:
    mov al, [si]
    mov es:[di], al
    mov es:[di+1], ah
    inc si
    add di, 2
    loop print_to

    ; 5. 输出 "masm!"（5个字符，属性0x71）
    mov cx, 5
    mov ah, 71h
print_masm:
    mov al, [si]
    mov es:[di], al
    mov es:[di+1], ah
    inc si
    add di, 2
    loop print_masm

    ; 6. 程序结束
    mov ah, 0
    int 16h

code ends
end start