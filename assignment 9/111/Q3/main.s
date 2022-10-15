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
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r15
	movl	%edi, %ebx
	xorl	%edi, %edi
	callq	_time
	movl	%eax, %edi
	callq	_srand
	callq	_newLL
	cmpl	$2, %ebx
	jne	LBB0_15
## %bb.1:
	movq	%rax, %r14
	movq	8(%r15), %rdi
	callq	_atoi
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	movl	$1, %r13d
	xorl	%ebx, %ebx
	movq	_A@GOTPCREL(%rip), %r12
	.p2align	4, 0x90
LBB0_2:                                 ## =>This Inner Loop Header: Depth=1
	movl	%ebx, (%r12,%rbx,2)
	callq	_rand
	cltq
	imulq	$-2147418109, %rax, %r15 ## imm = 0x80010003
	shrq	$32, %r15
	addl	%eax, %r15d
	movl	%r15d, %ecx
	shrl	$31, %ecx
	sarl	$14, %r15d
	addl	%ecx, %r15d
	movl	%r15d, %ecx
	shll	$15, %ecx
	subl	%ecx, %r15d
	addl	%eax, %r15d
	shll	$16, %r15d
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
	orl	%r15d, %eax
                                        ## kill: def $eax killed $eax killed $rax
	cltd
	idivl	%r13d
	movl	(%r12,%rbx,2), %eax
	movslq	%edx, %rcx
	movl	(%r12,%rcx,4), %edx
	movl	%edx, (%r12,%rbx,2)
	movl	%eax, (%r12,%rcx,4)
	addq	$2, %rbx
	incl	%r13d
	cmpq	$300, %rbx              ## imm = 0x12C
	jne	LBB0_2
## %bb.3:
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB0_4:                                 ## =>This Inner Loop Header: Depth=1
	movl	(%r12,%rbx,4), %esi
	movq	%r14, %rdi
	callq	_appendLL
	incq	%rbx
	cmpq	$150, %rbx
	jne	LBB0_4
## %bb.5:
	movq	_cycles@GOTPCREL(%rip), %r13
	xorl	%r12d, %r12d
	movl	-44(%rbp), %r15d        ## 4-byte Reload
	.p2align	4, 0x90
LBB0_6:                                 ## =>This Inner Loop Header: Depth=1
	## InlineAsm Start
	cpuid
	rdtscp
	movl	%eax, %esi

	## InlineAsm End
	movl	%esi, _start_time(%rip)
	testl	%r15d, %r15d
	je	LBB0_8
## %bb.7:                               ##   in Loop: Header=BB0_6 Depth=1
	movl	$150, %esi
	movq	_A@GOTPCREL(%rip), %rdi
	movl	%r12d, %edx
	callq	_lsearch
	movslq	%r12d, %rsi
	leaq	(,%rsi,4), %rcx
	addq	_P@GOTPCREL(%rip), %rcx
	jmp	LBB0_9
	.p2align	4, 0x90
LBB0_8:                                 ##   in Loop: Header=BB0_6 Depth=1
	movq	%r14, %rdi
	movl	%r12d, %esi
	callq	_LLsearch
	movslq	%r12d, %rsi
	leaq	(,%rsi,4), %rcx
	addq	_Q@GOTPCREL(%rip), %rcx
LBB0_9:                                 ##   in Loop: Header=BB0_6 Depth=1
	movl	%eax, (%rcx)
	## InlineAsm Start
	cpuid
	rdtscp
	movl	%eax, %r8d

	## InlineAsm End
	movl	%r8d, _end_time(%rip)
	subl	_start_time(%rip), %r8d
	movl	%r8d, (%r13,%rsi,4)
	cmpl	$4000, %r8d             ## imm = 0xFA0
	jl	LBB0_11
## %bb.10:                              ##   in Loop: Header=BB0_6 Depth=1
	leal	1(%r12), %esi
	xorl	%eax, %eax
	leaq	L_.str(%rip), %rdi
	movl	%r8d, %edx
	callq	_printf
	decl	%r12d
LBB0_11:                                ##   in Loop: Header=BB0_6 Depth=1
	incl	%r12d
	cmpl	$300, %r12d             ## imm = 0x12C
	jl	LBB0_6
## %bb.12:
	movq	_total@GOTPCREL(%rip), %rcx
	movq	$0, (%rcx)
	pxor	%xmm0, %xmm0
	movl	$10, %eax
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
LBB0_13:                                ## =>This Inner Loop Header: Depth=1
	pmovsxdq	-40(%r13,%rax,4), %xmm2
	pmovsxdq	-32(%r13,%rax,4), %xmm3
	paddq	%xmm0, %xmm2
	paddq	%xmm1, %xmm3
	pmovsxdq	-24(%r13,%rax,4), %xmm1
	pmovsxdq	-16(%r13,%rax,4), %xmm4
	pmovsxdq	-8(%r13,%rax,4), %xmm0
	paddq	%xmm1, %xmm0
	paddq	%xmm2, %xmm0
	pmovsxdq	(%r13,%rax,4), %xmm1
	paddq	%xmm4, %xmm1
	paddq	%xmm3, %xmm1
	addq	$12, %rax
	cmpq	$310, %rax              ## imm = 0x136
	jne	LBB0_13
## %bb.14:
	paddq	%xmm0, %xmm1
	pshufd	$78, %xmm1, %xmm0       ## xmm0 = xmm1[2,3,0,1]
	paddq	%xmm1, %xmm0
	movq	%xmm0, %rax
	movabsq	$7870610804782742023, %rdx ## imm = 0x6D3A06D3A06D3A07
	imulq	%rdx
	movq	%xmm0, (%rcx)
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	leaq	(%rdx,%rax), %rsi
	leaq	L_.str.1(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	%r14, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_freeLL                 ## TAILCALL
LBB0_15:
	leaq	L_str(%rip), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_puts                   ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_start_time             ## @start_time
.zerofill __DATA,__common,_start_time,4,2
	.globl	_end_time               ## @end_time
.zerofill __DATA,__common,_end_time,4,2
	.comm	_A,600,4                ## @A
	.comm	_P,1200,4               ## @P
	.comm	_Q,1200,4               ## @Q
	.comm	_cycles,1200,4          ## @cycles
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Sample %d completed in %d clock cycles - DISCARDED.\n"

	.comm	_total,8,3              ## @total
L_.str.1:                               ## @.str.1
	.asciz	"Average of %ld clock cycles.\n"

	.p2align	4               ## @str
L_str:
	.asciz	"Must enter either 0 for linked list or 1 for array."


.subsections_via_symbols
