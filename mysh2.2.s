section .text
  global _start
    _start:
	BITS 32
	jmp short two
    one:
 	pop ebx
	xor eax, eax
	mov [ebx+12], al	; save 0x00 (1 byte) to memory at address ebx+12 = first *
	mov [ebx+17], al	; save 0x00 (1 byte) to memory at address ebx+17 = second *
	mov [ebx+22], al	; save 0x00 (1 byte) to memory at address ebx+22 = third *
	mov [ebx+27], eax	; save 0x00 (4 bytes) to first ****

	mov [ebx+23],  ebx	; put /usr/bin/env command in arg0
	
	lea edx, [ebx+13]	; get the address of first env var
	mov [ebx+31], edx	; load address of first env var to env0

	lea edx, [ebx+18]	; get the address of second env var
	mov [ebx+35], edx	; load the address of second argument to env1

	mov [ebx+39], eax	; put null in last ****
	xor edx, edx

	lea ecx, [ebx+23]	; load the arguments From arg0
	lea edx, [ebx+31]	; load the env variables from env0 to ****

	mov al,  0x0b
	int 0x80,
     two:
 	call one
 	db '/usr/bin/env*a=11*b=22*arg0****env0env1****'
