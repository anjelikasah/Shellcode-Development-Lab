section .text
  global _start
    _start:
      ; Store the argument string on stack

      xor  eax, eax 
      push eax          ; Use 0 to terminate the string      
	push "//sh"
      push "/bin"
      mov  ebx, esp     ; Get the string address

	xor edx, edx
	mov dl, "-"
	mov dh, "c"
	push edx
	mov edx, esp
	
	xor ecx, ecx
	mov cl, "l"
	mov ch, "a"
	push ecx	
	push "ls -"
	mov ecx, esp	; store ls -la to ecx
	

      ; Construct the argument array argv[]
      push eax          ; argv[3] = 0
	push ecx	; argv[2] = ls -la
	push edx	; argv[1] = -c
      push ebx          ; argv[0] points "/bin/bash"
      mov  ecx, esp     ; Get the address of argv[]
   
      ; For environment variable 
      xor  edx, edx     ; No env variables 

      ; Invoke execve()
      xor  eax, eax     ; eax = 0x00000000
      mov   al, 0x0b    ; eax = 0x0000000b
      int 0x80
