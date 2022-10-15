# fact(n): Buggy version
	.globl fact
# n in edi
fact:
	cmpl $1, %edi
	jg endif
	movq $1, %rax
	ret
endif:
	decl %edi
	pushq %rdi
	call fact
	imulq (%rsp), %rax
	leaq 8(%rsp), %rsp
	popq %rdi
	ret
