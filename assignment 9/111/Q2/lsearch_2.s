	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_lsearch_2              ## -- Begin function lsearch_2
	.p2align	4, 0x90
_lsearch_2:                             ## @lsearch_2
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	testl	%esi, %esi
	jle	LBB0_1
## %bb.2:
	movslq	%esi, %rax
	movl	-4(%rdi,%rax,4), %r8d
	movl	%edx, -4(%rdi,%rax,4)
	leaq	-1(%rax), %rcx
	movl	$-1, %esi
	movq	%rdi, %rax
	.p2align	4, 0x90
LBB0_3:                                 ## =>This Inner Loop Header: Depth=1
	incl	%esi
	cmpl	%edx, (%rax)
	leaq	4(%rax), %rax
	jne	LBB0_3
## %bb.4:
	cmpl	%edx, %r8d
	movl	$-1, %eax
	cmovel	%ecx, %eax
	movl	%r8d, (%rdi,%rcx,4)
	cmpl	%esi, %ecx
	cmovgl	%esi, %eax
	popq	%rbp
	retq
LBB0_1:
	movl	$-1, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
