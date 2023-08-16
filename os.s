org 7c00H
mov ah,0x06				
    mov bh,0x07					
    mov al,0
    mov cx,0   
    mov dx,0xffff  
    mov bh,0x00			
    int 0x10
Re:
mov bp,Msg
mov ax,cs
mov es,ax
mov al,9
mov cx,3
s1:
mov dl,al
out 70H,al
in al,71H
mov ah,al
shr ah,4
and al,00001111B
add ah,30H
add al,30H
mov es:[bp],ah
mov es:[bp+1],al
add bp,3

mov al,dl
sub al,1

loop s1


mov bp,Msg
add bp,9
mov cx,3
mov al,4
s2:
mov dl,al
out 70H,al
in al,71H
mov ah,al
shr ah,4
and al,00001111B
add ah,30H
add al,30H
mov es:[bp],ah
mov es:[bp+1],al
add bp,3

mov al,dl
sub al,2

loop s2

mov bp,Msg
mov cx,17
	mov ax,0B800H
	mov ds,ax

	xor si,si
	
	mov bl,00000010B
	l:
		mov al,es:[bp]
		mov ds:[si],al
		mov ds:[si+1],bl
		add bp,1
		add si,2

	loop l

jmp Re


Msg:db "YY/MM/DD HH:MM:SS"
times 510-($-$$) db 0 
dw 0xaa55 