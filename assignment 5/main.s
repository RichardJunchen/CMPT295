	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	leaq	L_str(%rip), %rdi
	callq	_puts
	leaq	_A(%rip), %rdi
	movq	_C@GOTPCREL(%rip), %rbx
	movl	$4, %edx
	movq	%rbx, %rsi
	callq	_copy
	movsbl	_A(%rip), %esi
	movsbl	_A+1(%rip), %edx
	movsbl	_A+2(%rip), %ecx
	movsbl	_A+3(%rip), %r8d
	leaq	L_.str.2(%rip), %r14
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	movsbl	_A+4(%rip), %esi
	movsbl	_A+5(%rip), %edx
	movsbl	_A+6(%rip), %ecx
	movsbl	_A+7(%rip), %r8d
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	movsbl	_A+8(%rip), %esi
	movsbl	_A+9(%rip), %edx
	movsbl	_A+10(%rip), %ecx
	movsbl	_A+11(%rip), %r8d
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	movsbl	_A+12(%rip), %esi
	movsbl	_A+13(%rip), %edx
	movsbl	_A+14(%rip), %ecx
	movsbl	_A+15(%rip), %r8d
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	movl	$10, %edi
	callq	_putchar
	movsbl	(%rbx), %esi
	movsbl	1(%rbx), %edx
	movsbl	2(%rbx), %ecx
	movsbl	3(%rbx), %r8d
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	movsbl	4(%rbx), %esi
	movsbl	5(%rbx), %edx
	movsbl	6(%rbx), %ecx
	movsbl	7(%rbx), %r8d
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	movsbl	8(%rbx), %esi
	movsbl	9(%rbx), %edx
	movsbl	10(%rbx), %ecx
	movsbl	11(%rbx), %r8d
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	movsbl	12(%rbx), %esi
	movsbl	13(%rbx), %edx
	movsbl	14(%rbx), %ecx
	movsbl	15(%rbx), %r8d
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	movl	$10, %edi
	callq	_putchar
	leaq	L_str.4(%rip), %rdi
	callq	_puts
	movsbl	(%rbx), %esi
	movsbl	1(%rbx), %edx
	movsbl	2(%rbx), %ecx
	movsbl	3(%rbx), %r8d
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	movsbl	4(%rbx), %esi
	movsbl	5(%rbx), %edx
	movsbl	6(%rbx), %ecx
	movsbl	7(%rbx), %r8d
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	movsbl	8(%rbx), %esi
	movsbl	9(%rbx), %edx
	movsbl	10(%rbx), %ecx
	movsbl	11(%rbx), %r8d
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	movsbl	12(%rbx), %esi
	movsbl	13(%rbx), %edx
	movsbl	14(%rbx), %ecx
	movsbl	15(%rbx), %r8d
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	movl	$10, %edi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	_putchar                ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_printMatrixByRow       ## -- Begin function printMatrixByRow
	.p2align	4, 0x90
_printMatrixByRow:                      ## @printMatrixByRow
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	testl	%esi, %esi
	jle	LBB1_3
## %bb.1:
	movq	%rdi, %rbx
	movslq	%esi, %r15
	movl	%esi, %r12d
	addq	$3, %rbx
	leaq	L_.str.2(%rip), %r14
	.p2align	4, 0x90
LBB1_2:                                 ## =>This Inner Loop Header: Depth=1
	movsbl	-3(%rbx), %esi
	movsbl	-2(%rbx), %edx
	movsbl	-1(%rbx), %ecx
	movsbl	(%rbx), %r8d
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	addq	%r15, %rbx
	decq	%r12
	jne	LBB1_2
LBB1_3:
	movl	$10, %edi
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_putchar                ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__DATA,__data
	.globl	_A                      ## @A
	.p2align	4
_A:
	.ascii	"\001\376\003\374"
	.ascii	"\373\006\371\b"
	.ascii	"\377\002\375\004"
	.ascii	"\005\372\007\370"

	.comm	_C,16,4                 ## @C
	.section	__TEXT,__cstring,cstring_literals
L_.str.2:                               ## @.str.2
	.asciz	"%4d %4d %4d %4d"

L_str:                                  ## @str
	.asciz	"Copy: "

	.p2align	4               ## @str.4
L_str.4:
	.asciz	"Rotating the matrix by 90 degrees clockwise: "


.subsections_via_symbols
