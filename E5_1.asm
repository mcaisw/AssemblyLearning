assume cs:code,ds:data,ss:mystack

data segment
     dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
data ends

mystack segment
      dw 0,0,0,0,0,0,0,0
mystack ends

code segment

start: mov ax,mystack
       mov ss,ax
	   mov sp,16
	   
	   mov ax,data
	   mov ds,ax
	   
	   push ds:[0]
	   push ds:[2]
	   pop  ds:[2]
	   pop  ds:[0]
	   
	   mov ax,4c00h
	   int 21h
code ends
end start
	   