	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_newLL                  ## -- Begin function newLL
	.p2align	4, 0x90
_newLL:                                 ## @newLL
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$24, %edi
	callq	_malloc
	testq	%rax, %rax
	je	LBB0_2
## %bb.1:
	movl	$0, (%rax)
	movq	$0, 16(%rax)
	movq	$0, 8(%rax)
LBB0_2:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_freeLL                 ## -- Begin function freeLL
	.p2align	4, 0x90
_freeLL:                                ## @freeLL
	.cfi_startproc
## %bb.0:
	testq	%rdi, %rdi
	je	LBB1_4
## %bb.1:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, %r14
	movq	8(%rdi), %rdi
	testq	%rdi, %rdi
	je	LBB1_3
	.p2align	4, 0x90
LBB1_2:                                 ## =>This Inner Loop Header: Depth=1
	movq	8(%rdi), %rbx
	callq	_free
	movq	%rbx, %rdi
	testq	%rbx, %rbx
	jne	LBB1_2
LBB1_3:
	movq	%r14, %rdi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	_free                   ## TAILCALL
LBB1_4:
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_appendLL               ## -- Begin function appendLL
	.p2align	4, 0x90
_appendLL:                              ## @appendLL
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
	testq	%rdi, %rdi
	je	LBB2_8
## %bb.1:
	movl	%esi, %r14d
	movq	%rdi, %rbx
	movl	$16, %edi
	callq	_malloc
	testq	%rax, %rax
	je	LBB2_8
## %bb.2:
	movl	%r14d, (%rax)
	movq	$0, 8(%rax)
	incl	(%rbx)
	cmpq	$0, 8(%rbx)
	je	LBB2_5
## %bb.3:
	movq	16(%rbx), %rcx
	jmp	LBB2_4
LBB2_5:
	movq	16(%rbx), %rcx
	testq	%rcx, %rcx
	je	LBB2_6
LBB2_4:
	addq	$8, %rcx
LBB2_7:
	movq	%rax, (%rcx)
	movq	%rax, 16(%rbx)
LBB2_8:
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
LBB2_6:
	leaq	8(%rbx), %rcx
	jmp	LBB2_7
	.cfi_endproc
                                        ## -- End function
	.globl	_LLsearch               ## -- Begin function LLsearch
	.p2align	4, 0x90
_LLsearch:                              ## @LLsearch
	pushq	%rbp
	movq	%rsp, %rbp
	movq	8(%rdi), %rcx
	movl	$-1, %eax
	testq	%rcx, %rcx
	je	LBB3_5
## %bb.1:
	xorl	%edx, %edx
LBB3_2:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	%esi, (%rcx)
	je	LBB3_3
## %bb.4:                               ##   in Loop: Header=BB3_2 Depth=1
	incl	%edx
	movq	8(%rcx), %rcx
	testq	%rcx, %rcx
	jne	LBB3_2
LBB3_5:
	popq	%rbp
	retq
LBB3_3:
	movl	%edx, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_LLdump                 ## -- Begin function LLdump
	.p2align	4, 0x90
_LLdump:                                ## @LLdump
	.cfi_startproc
## %bb.0:
	testq	%rdi, %rdi
	je	LBB4_5
## %bb.1:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	8(%rdi), %rbx
	testq	%rbx, %rbx
	je	LBB4_4
## %bb.2:
	leaq	L_.str(%rip), %r14
	.p2align	4, 0x90
LBB4_3:                                 ## =>This Inner Loop Header: Depth=1
	movl	(%rbx), %esi
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	_printf
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	LBB4_3
LBB4_4:
	movl	$10, %edi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	_putchar                ## TAILCALL
LBB4_5:
	movl	$10, %edi
	jmp	_putchar                ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_lsearch                ## -- Begin function lsearch
	.p2align	4, 0x90
_lsearch:                               ## @lsearch
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$-1, %eax
	testl	%esi, %esi
	jle	LBB5_5
## %bb.1:
	movslq	%esi, %rsi
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB5_2:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	%edx, (%rdi,%rcx,4)
	je	LBB5_4
## %bb.3:                               ##   in Loop: Header=BB5_2 Depth=1
	incq	%rcx
	cmpq	%rsi, %rcx
	jl	LBB5_2
LBB5_5:
	popq	%rbp
	retq
LBB5_4:
	movl	%ecx, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	" %d"


.subsections_via_symbols
