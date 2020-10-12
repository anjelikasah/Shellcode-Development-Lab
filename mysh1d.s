section .text
  global _start
    _start:
      ; Store the argument string on stack

      xor  eax, eax 
      push eax          ; Use 0 to terminate the string      
	push "/env"
      push "/bin"
	push "/usr"
      mov  ebx, esp     ; Get the string address

	push "4"
	push "=123"
	push "cccc"
	mov esi, esp

	push eax
	push "5678"
	push "bbb="
	mov edx, esp

	push eax
	push "1234"
	push "aaa="
	mov edi, esp

      ; Construct the argument array argv[]
      push eax          ; argv[3] = 0
      push ebx          ; argv[0] points "/bin/bash"
      mov  ecx, esp     ; Get the address of argv[]
   
      ; For environment variable 
	push esi	; cccc=1234
	push edx	; bbb=5678
	push edi	; aaa=1234
	mov edx, esp	; get the address of environment variables

      ; Invoke execve()
      xor  eax, eax     ; eax = 0x00000000
      mov   al, 0x0b    ; eax = 0x0000000b
      int 0x80
