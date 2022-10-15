# Name: calculator.s
# Junchen Li
# 2020.3.6
# 301385486
# add a header comment block

	.globl	lt
	.globl	plus
	.globl	minus
	.globl	mul

# x in edi, y in esi

lt: # add a description to this function
	xorl	%eax, %eax
	cmpl	%esi, %edi
	setl	%al
	ret

plus:  # performs integer addition
# Requirement:
# - you cannot use add* instruction
    leal (%edi,%esi), %eax   # eax <- x + y
    ret

minus: # performs integer subtraction
# Requirement:
# - you cannot use sub* instruction
    movl %esi, %eax
    negl %eax
    leal (%edi,%eax), %eax   # eax <- x + (- y)
    ret

mul: # performs integer multiplication - when both operands are non-negative!
 # x in edi, y in esi
 # Requirements:
# - cannot use imul* instruction
# - you must use recursion (no loop) and the stack
mul:
    xorl    %eax, %eax      # we set the return value to zero
    movl    %esi, %eax      # we save the value y into the return value for counting purpose
    testl   %esi, %esi      # test if the x equal to zero  if (x==0)
    je      done            # if it equal to zero then jump to return
    pushq   %rbx            # push the callee saved value to the stack
    movl    %edi, %ebx      # let callee saved value save x value x+mul(x,y-1)
    pushl   %edi
    pushl   %esi
    subl    $1,   %esi      # change the value of y to y-1
    call    mul             # call the mul function
    addl    %ebx, %eax      # add the function returnd value with the x. x+mul(x,y-1)
    popq    %rbx            # pop the rsp value
    popl    %edi
    popl    %esi
done:
    ret
