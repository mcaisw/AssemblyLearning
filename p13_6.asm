assume cs:code
code segment

    mov ah,2         ; 置光标
    mov bh,0         ; 第0页
    mov dh,5         ; ch中放行号
    mov dl,12        ; dl中放列号
    int 10h

    mov ah,9         ; 在光标位置显示字符
    mov al,'a'       ; 字符
    mov bl,10001010b ; 颜色属性
    mov bh,0         ; 第0页
    mov cx,3         ; 字符重复个数
    int 10h

    mov ax,4c00h
    int 21h

code ends
end