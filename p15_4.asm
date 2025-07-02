assume cs:code

stack segment
  db 128 dup (0)
stack ends
 
code segment

start:  mov ax,stack			;是不是因为没有初始化stack segment
        mov ss,ax
		mov sp,128
		
        mov ax,0b800h
        mov es,ax
		mov ah,'a'
		
    s:  mov al, ah           ; al = 字符
        mov ah, 00011111b    ; ah = 属性（可自定义颜色）
		mov es:[160*12+40*2], ax
        mov ah, al           ; 恢复 ah = 字符
	    call delay
	    inc ah
		cmp ah,'z'
		jna s
		
		mov ax,4c00h
		int 21h
		
delay:  push ax
        push dx
        mov dx,0010h
		mov ax,0
		
   s1:  sub ax,1
		sbb dx,0
		cmp ax,0
		jne s1
		cmp dx,0
		jne s1
		pop dx
		pop ax
		ret
code ends
end start
	  
