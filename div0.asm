assume cs:code

code segment

start:  mov ax,cs                        
        mov ds,ax                       ;cs段地址写入data segement
		mov si,offset do0               ;si寄存器写入do0程序的偏移入口

        mov ax,0                        
        mov es,ax                       ;extra segement段地址设置0
        mov di,200h                     ;从偏移200h开始
        
        mov,cx,offset doend-offset do0  ;设置cx的长度
        cld                             ;传输方向为正
		                       
		rep movsb                       ;开始传输
		;设置中断向量
		mov ax,0
		mov es,ax
		mov word ptr es:[0*4],200h
		mov word ptr es:[0*4+2],0
		
		mov ax,4c00h
		int 21h
		
do0:    jmp short do0start
        db 'overflow!'


do0start:mov ax,cs
         mov ds,ax
		 mov si,202h
		
		 mov ax,0b800h
		 mov es,ax
		 mov di,12*160+36*2
		
		 mov cx,9
s:       mov al,[si]
         mov es:[di],al
         inc si
         add di,2    ;是因为显示缓冲区一个单元里是两个字节，第一个是数据，第二个是属性字节
         loop s		
		 
         mov ax,4c00h
		 int 21h
do0end:  nop
		
code ends
end start