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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$3496, %rsp             ## imm = 0xDA8
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	leaq	L_.str(%rip), %rdi
	callq	_puts
	movq	_A@GOTPCREL(%rip), %r13
	movl	$0, (%r13)
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	callq	_time
	movl	%eax, %edi
	callq	_srand
	movl	$3, %r14d
	movl	$-1, %r15d
	movl	$1, %r12d
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	%r12d, %eax
	movl	$2863311531, %ecx       ## imm = 0xAAAAAAAB
	imulq	%rcx, %rax
	shrq	$33, %rax
	leal	(%rax,%rax,2), %eax
	xorl	%ecx, %ecx
	addl	%r15d, %eax
	sete	%cl
	addl	%r14d, %ecx
	movl	%ecx, 4(%r13,%rbx,4)
	callq	_rand
	cltq
	imulq	$-2147418109, %rax, %r13 ## imm = 0x80010003
	shrq	$32, %r13
	addl	%eax, %r13d
	movl	%r13d, %ecx
	shrl	$31, %ecx
	sarl	$14, %r13d
	addl	%ecx, %r13d
	movl	%r13d, %ecx
	shll	$15, %ecx
	subl	%ecx, %r13d
	addl	%eax, %r13d
	shll	$16, %r13d
	callq	_rand
	movslq	%eax, %rcx
	imulq	$-2147450879, %rcx, %rax ## imm = 0x80008001
	shrq	$32, %rax
	addl	%ecx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	sarl	$15, %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shll	$16, %edx
	subl	%edx, %eax
	addl	%ecx, %eax
	orl	%r13d, %eax
	movq	_A@GOTPCREL(%rip), %r13
	leal	2(%rbx), %ecx
                                        ## kill: def $eax killed $eax killed $rax
	cltd
	idivl	%ecx
	movl	4(%r13,%rbx,4), %eax
	movslq	%edx, %rcx
	movl	(%r13,%rcx,4), %edx
	movl	%edx, 4(%r13,%rbx,4)
	movl	%eax, (%r13,%rcx,4)
	addl	$3, %r14d
	decl	%r15d
	incl	%r12d
	incq	%rbx
	cmpq	$4999999, %rbx          ## imm = 0x4C4B3F
	jne	LBB0_1
## %bb.2:
	movl	19999996(%r13), %r15d
	movl	20000000(%r13), %r12d
	leaq	L_.str.1(%rip), %rdi
	callq	_puts
	leaq	L_.str.2(%rip), %rdi
	xorl	%ebx, %ebx
	movl	$1, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	-3536(%rbp), %rsi
	xorl	%edi, %edi
	callq	_getrusage
	movl	19999996(%r13), %eax
	movl	20000000(%r13), %ecx
	.p2align	4, 0x90
LBB0_3:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_4 Depth 2
	movl	$2, %esi
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB0_4:                                 ##   Parent Loop BB0_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpl	%ebx, -8(%r13,%rsi,4)
	je	LBB0_11
## %bb.5:                               ##   in Loop: Header=BB0_4 Depth=2
	cmpl	%ebx, -4(%r13,%rsi,4)
	je	LBB0_12
## %bb.6:                               ##   in Loop: Header=BB0_4 Depth=2
	cmpl	%ebx, (%r13,%rsi,4)
	je	LBB0_13
## %bb.7:                               ##   in Loop: Header=BB0_4 Depth=2
	cmpl	%ebx, 4(%r13,%rsi,4)
	je	LBB0_14
## %bb.8:                               ##   in Loop: Header=BB0_4 Depth=2
	cmpl	%ebx, 8(%r13,%rsi,4)
	je	LBB0_15
## %bb.9:                               ##   in Loop: Header=BB0_4 Depth=2
	addq	$5, %rdx
	leaq	5(%rsi), %rdi
	addq	$3, %rsi
	cmpq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rdi, %rsi
	jb	LBB0_4
## %bb.10:                              ##   in Loop: Header=BB0_3 Depth=1
	movl	$-1, %edx
	jmp	LBB0_16
LBB0_11:                                ##   in Loop: Header=BB0_3 Depth=1
	addq	$-2, %rsi
	movq	%rsi, %rdx
	jmp	LBB0_16
LBB0_12:                                ##   in Loop: Header=BB0_3 Depth=1
	incq	%rdx
	jmp	LBB0_16
LBB0_13:                                ##   in Loop: Header=BB0_3 Depth=1
	addq	$2, %rdx
	jmp	LBB0_16
LBB0_14:                                ##   in Loop: Header=BB0_3 Depth=1
	addq	$3, %rdx
	jmp	LBB0_16
LBB0_15:                                ##   in Loop: Header=BB0_3 Depth=1
	addq	$4, %rdx
	.p2align	4, 0x90
LBB0_16:                                ##   in Loop: Header=BB0_3 Depth=1
	movl	%edx, -3248(%rbp,%rbx,4)
	cmpl	%ecx, %r12d
	jne	LBB0_27
## %bb.17:                              ##   in Loop: Header=BB0_3 Depth=1
	cmpl	%eax, %r15d
	jne	LBB0_28
## %bb.18:                              ##   in Loop: Header=BB0_3 Depth=1
	incq	%rbx
	cmpq	$399, %rbx              ## imm = 0x18F
	jbe	LBB0_3
## %bb.19:
	xorl	%r14d, %r14d
	leaq	-3392(%rbp), %rsi
	xorl	%edi, %edi
	callq	_getrusage
	movq	-3392(%rbp), %rax
	subq	-3536(%rbp), %rax
	imulq	$1000000, %rax, %rax    ## imm = 0xF4240
	movslq	-3384(%rbp), %rsi
	movslq	-3528(%rbp), %rcx
	subq	%rcx, %rsi
	addq	%rax, %rsi
	leaq	L_.str.5(%rip), %rdi
	movl	$1, %edx
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.2(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	-3536(%rbp), %rsi
	xorl	%edi, %edi
	callq	_getrusage
	.p2align	4, 0x90
LBB0_20:                                ## =>This Inner Loop Header: Depth=1
	movl	$5000000, %esi          ## imm = 0x4C4B40
	movq	%r13, %rdi
	movl	%r14d, %edx
	callq	_lsearch_2
	movl	%eax, -1648(%rbp,%r14,4)
	cmpl	20000000(%r13), %r12d
	jne	LBB0_27
## %bb.21:                              ##   in Loop: Header=BB0_20 Depth=1
	cmpl	19999996(%r13), %r15d
	jne	LBB0_28
## %bb.22:                              ##   in Loop: Header=BB0_20 Depth=1
	incq	%r14
	cmpq	$400, %r14              ## imm = 0x190
	jb	LBB0_20
## %bb.23:
	xorl	%r14d, %r14d
	leaq	-3392(%rbp), %rsi
	xorl	%edi, %edi
	callq	_getrusage
	movq	-3392(%rbp), %rax
	subq	-3536(%rbp), %rax
	imulq	$1000000, %rax, %rax    ## imm = 0xF4240
	movslq	-3384(%rbp), %rsi
	movslq	-3528(%rbp), %rcx
	subq	%rcx, %rsi
	addq	%rax, %rsi
	leaq	L_.str.5(%rip), %rdi
	movl	$2, %edx
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.6(%rip), %rdi
	movl	$3, %esi
	xorl	%eax, %eax
	callq	_printf
	movl	$5000000, %r8d          ## imm = 0x4C4B40
	xorl	%r15d, %r15d
	xorl	%esi, %esi
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	.p2align	4, 0x90
LBB0_24:                                ## =>This Inner Loop Header: Depth=1
	movl	-3248(%rbp,%r13,4), %r11d
	xorl	%edi, %edi
	cmpl	$-1, %r11d
	movl	%r11d, %ebx
	cmovel	%r8d, %ebx
	sete	%r10b
	movl	-1648(%rbp,%r13,4), %ecx
	xorl	%edx, %edx
	cmpl	$-1, %ecx
	sete	%r9b
	movl	%ecx, %eax
	cmovel	%r8d, %eax
	cmpl	%ecx, %r11d
	jne	LBB0_32
## %bb.25:                              ##   in Loop: Header=BB0_24 Depth=1
	movb	%r10b, %dil
	addq	%rdi, %rsi
	movslq	%ebx, %rdi
	addq	%rdi, %r12
	movb	%r9b, %dl
	addq	%rdx, %r14
	cltq
	addq	%rax, %r15
	incq	%r13
	cmpq	$399, %r13              ## imm = 0x18F
	jbe	LBB0_24
## %bb.26:
	leaq	L_.str.8(%rip), %rdi
	xorl	%eax, %eax
	movq	%r14, %rdx
	callq	_printf
	leaq	L_.str.9(%rip), %rdi
	xorl	%eax, %eax
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	_printf
	jmp	LBB0_30
LBB0_27:
	leaq	L_.str.3(%rip), %rdi
	jmp	LBB0_29
LBB0_28:
	leaq	L_.str.4(%rip), %rdi
LBB0_29:
	callq	_perror
LBB0_30:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB0_33
## %bb.31:
	addq	$3496, %rsp             ## imm = 0xDA8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB0_32:
	leaq	L_.str.7(%rip), %rdi
	jmp	LBB0_29
LBB0_33:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_lsearch_1              ## -- Begin function lsearch_1
	.p2align	4, 0x90
_lsearch_1:                             ## @lsearch_1
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$-1, %eax
	testl	%esi, %esi
	jle	LBB1_5
## %bb.1:
	movslq	%esi, %rsi
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB1_2:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	%edx, (%rdi,%rcx,4)
	je	LBB1_4
## %bb.3:                               ##   in Loop: Header=BB1_2 Depth=1
	incq	%rcx
	cmpq	%rsi, %rcx
	jl	LBB1_2
LBB1_5:
	popq	%rbp
	retq
LBB1_4:
	movl	%ecx, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Initializing array . . ."

	.comm	_A,20000000,4           ## @A
L_.str.1:                               ## @.str.1
	.asciz	"Array initialized. . ."

L_.str.2:                               ## @.str.2
	.asciz	"Starting test of function %d . . .\n"

L_.str.3:                               ## @.str.3
	.asciz	"Error: A[N] not consistent.\n"

L_.str.4:                               ## @.str.4
	.asciz	"Error: A[N-1] not consistent.\n"

L_.str.5:                               ## @.str.5
	.asciz	"It took %ld microseconds to run function %d.\n"

L_.str.6:                               ## @.str.6
	.asciz	"Totalling work %d . . .\n"

L_.str.7:                               ## @.str.7
	.asciz	"Error: Results of searches disagree.\n"

L_.str.8:                               ## @.str.8
	.asciz	"Total misses = %ld, %ld\n"

L_.str.9:                               ## @.str.9
	.asciz	"Total of positions searched = %ld, %ld\n"


.subsections_via_symbols
