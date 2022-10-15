# add a header comment block

	.globl	lt
	.globl	plus
	.globl	minus
	.globl	mul

# x in edi, y in esi    return value in eax

lt: # add a description to this function
	xorl	%eax, %eax
	cmpl	%esi, %edi
	setl	%al
	ret

plus:  # performs integer addition
# Requirement:
# - you cannot use add* instruction


minus: # performs integer subtraction
# Requirement:
# - you cannot use sub* instruction


mul: # performs integer multiplication - when both operands are non-negative!
# You can assume that both operands are non-negative.
# Requirements:
# - you cannot use imul* instruction 
#   (or any kind of instruction that multiplies such as mul)
# - you must use a loop

# algorithm:
#
#
#
#
