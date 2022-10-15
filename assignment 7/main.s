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
	cmpl	$2, %edi
	jne	LBB0_2
## %bb.1:
	movq	8(%rsi), %rdi
	callq	_atoi
	movl	%eax, %ebx
	leaq	L_.str(%rip), %rdi
	xorl	%r14d, %r14d
	xorl	%eax, %eax
	movl	%ebx, %esi
	callq	_printf
	movl	%ebx, %edi
	callq	_fact
	movq	%rax, %rcx
	leaq	L_.str.1(%rip), %rdi
	xorl	%eax, %eax
	movl	%ebx, %esi
	movq	%rcx, %rdx
	callq	_printf
	jmp	LBB0_3
LBB0_2:
	leaq	L_str(%rip), %rdi
	callq	_puts
	movl	$1, %r14d
LBB0_3:
	movl	%r14d, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Calling fact(%d) ... "

L_.str.1:                               ## @.str.1
	.asciz	"and the result is %d! = %ld\n"

	.p2align	4               ## @str
L_str:
	.asciz	"Must supply 1 integer >= 0."


.subsections_via_symbols
