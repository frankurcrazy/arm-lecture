	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW
		LDR	R2,	=locked
	test:
		@ load lock value
		LDREX	R1,	[R0]	

		@ lock it if not lock
		CMP	R1, R2
		STREXNE R1, R2, [R0]	
		CMPNE R1, #1
		BEQ test
        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
    	LDR R2, =unlocked   
		STR	R2, [R0]
        @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
