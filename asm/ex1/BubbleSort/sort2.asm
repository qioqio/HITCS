INCLUDE  ASM32.INC

MAXN=1000

.DATA
		V	DWORD	MAXN	DUP(?)
		N	DWORD	?
.CODE
	MAIN	PROC
			INVOKE	printf,chr$("����������Ԫ�ظ�����")
			MOV		EAX,OFFSET N
			INVOKE	scanf,chr$("%d"),EAX
			INVOKE	printf,chr$("����������Ԫ�أ�",13,10)
			MOV		EBX,OFFSET V
			MOV		ECX,N
			MOV		ESI,0
	L1:		PUSH	ECX
			LEA		EAX,V[ESI*4]
			INVOKE	scanf,chr$("%d"),EAX
			POP		ECX
			INC		ESI
			LOOP	L1
			
			MOV		ECX,N
			DEC		ECX
	L2:		PUSH	ECX
			MOV		ESI,0
	L3:		MOV		EAX,V[ESI*4]
			MOV		EDX,V[ESI*4+4]
			CMP		EAX,EDX
			JLE		LL
			MOV		V[ESI*4],EDX
			MOV		V[ESI*4+4],EAX
	LL:		INC		ESI
			LOOP	L3
			POP		ECX
			INC		ESI
			LOOP	L2

			MOV		ECX,N
			MOV		ESI,0
	L4:		PUSH	ECX
			INVOKE	printf,chr$("%8d"),DWORD PTR V[ESI*4]
			POP		ECX
			INC		ESI
			LOOP	L4

			INVOKE	getchar
			INVOKE	getchar

			INVOKE	  ExitProcess,0 
	MAIN	ENDP											; ���� - �ӳ������

			END       MAIN									; END ָʾ���г��򵽴˽�������һ����ִ�����λ��Ϊmain
