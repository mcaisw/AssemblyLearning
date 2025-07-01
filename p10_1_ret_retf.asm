assume cs:code
stack segment
   db 16 dup (0)
stack ends

code segment
       mov ax,4c00h
	   int 21h
start: mov ax,stack    ;stack 物理地址压入ax寄存器
       mov ss,ax       ;通过ax，将stack 的物理地址存入ss（stack segment）寄存器，
       mov sp,16       ;stack pointer偏移设置为16
       mov ax,0        ;ax寄存器清零
       push ax         ;将ax里的值压入stack ，sp -2
       mov bx,0        ;bx寄存器清零
       ret             ;从stack里取出0，赋给IP,那么IP就是0，即mov ax，4c00h，
	   
code ends
end start