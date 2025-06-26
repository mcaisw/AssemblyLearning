assume cs:code
code segment
     mov ax,0ffffh        ;ax寄存器存入0ffff
	 mov ds,ax            ;ds（data segment）寄存器,用ax刚写入的值 0ffff
	 mov bx,6             ;bx寄存器 存入十进制6

     mov al,[bx]          ;;从ds:bx地址读取一个字节数据，存入al（ax的低8位）
	 mov ah,0             ;ax寄存器的高位清零
	 mov dx,0             ;累加寄存器清零
	 mov cx,18             ;cx 寄存器，通常和loop搭配，存入的是循环次数，表示要循环18次
	s:add dx,ax           ;ax 数值累加3次，放入累加寄存器dx里
     loop s
	
	mov ax,4c00h
	int 21h
code ends

end
	