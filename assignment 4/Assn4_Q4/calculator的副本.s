#name: calculator.s
#Junchen Li
#2020.2.12
# add a header comment block

	.globl	lt
	.globl	plus
	.globl	minus
	.globl	mul

# x in edi, y in esi  return value in eax

lt: # add a description to this function
	xorl	%eax, %eax
	cmpl	%esi, %edi
	setl	%al
	ret

plus:  # performs integer addition
# Requirement:
# - you cannot use add* instruction
    andq    %edi, %esi      //add then together
    movq    %esi, %eax      //move the result to the return value
    ret

minus: # performs integer subtraction
# Requirement:
# - you cannot use sub* instruction
    negq    %esi, %edi      // change to negative value
    andq    %edi, %esi      // and add them together as same as the minus
    movq    %esi, %eax
    ret



mul: # performs integer multiplication - when both operands are non-negative!
# You can assume that both operands are non-negative.
# Requirements:
# - you cannot use imul* instruction 
#   (or any kind of instruction that multiplies such as mul)
# - you must use a loop

# int mul (int x, int y)
# x in edi, y in esi  return value in eax
#we write a loop that let condition part less that y and there are y of x so add all x together, we can do the same as mul x*y  4*3=4+4+4
func :
    movq $0, %eax   // assignment the value zero to the return value
    xorl %rax, %rax   // assignment the value zero to the resiger x^x=0
loop:
    cmpq %rax, %esi    //compare the count value (eg. i) and y if it is less or equal
    jg  endloop        // if it is bigger than y then endloop and return!
    addq %edi, %eax     // add the value of x to the return value
    incq %rax       // and the count value i should be increase by one
    jmp loop        // when condition is correct then jump the loop and do it again
endloop:
    ret

# algorithm:

#return^return
#compare between the x and y, y-x=0
#set low byte of %esi to one or zero
# and return the value
