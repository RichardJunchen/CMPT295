# Name: matrix.s
# Junchen Li
# 2020.3.6
# 301385486
.globl    copy
    copy:
    # A in rdi, C in rsi, N in edx
        xorl %eax, %eax            # set eax to 0
    # since this function is a leaf function, no need to save caller-saved registers rcx and r8
        xorl %ecx, %ecx            # row number i is in ecx -> i = 0

    # For each row
    rowLoop:
        movl $0, %r8d            # column number j in r8d -> j = 0
        cmpl %edx, %ecx            # loop as long as i - N < 0
        jge doneWithRows

    # For each cell of this row
    colLoop:
        cmpl %edx, %r8d            # loop as long as j - N < 0
        jge doneWithCells

    # Compute the address of current cell that is copied from A to C
    # since this function is a leaf function, no need to save caller-saved registers r10 and r11
        movl %edx, %r10d        # r10d = N
            imull %ecx, %r10d    # r10d = i*N
        addl %r8d, %r10d        # j + i*N
        imull $1, %r10d         # r10 = L * (j + i*N) -> L is char (1Byte)
        movq %r10, %r11            # r11 = L * (j + i*N)
        addq %rdi, %r10            # r10 = A + L * (j + i*N)
        addq %rsi, %r11            # r11 = C + L * (j + i*N)

    # Copy A[L * (j + i*N)] to C[L * (j + i*N)]
        movb (%r10), %r9b       # temp = A[L * (j + i*N)]
        movb %r9b, (%r11)       # C[L * (j + i*N)] = temp

        incl %r8d                # column number j++ (in r8d)
        jmp colLoop                # go to next cell

    # Go to next row
    doneWithCells:
        incl %ecx                # row number i++ (in ecx)
        jmp rowLoop                # Play it again, Sam!

    doneWithRows:                # bye! bye!
        ret

    #####################



        .globl    transpose
    transpose:
    # A in rdi, C in rsi, N in edx, i (roll)in rcx, j (column) in r8
        xorl %eax, %eax          # set eax to 0
        xorl %ecx, %ecx          # set j to 0

    columnLoops:
        movl $0, %ecx            # Row number i in rcx change to zero
        cmpl %edx, %r8d          # go to the loop when j<n
        jge finishWithColumns    # if already fill-in all elements then jump to ret

    rowLoops:
        cmpl %edx, %ecx          # go to the loop if i < N
        jge finishWithRows       # finished the row fill-in then back to outside loop
    # compute the address for every cell and swap them with opposite order of i with j
    # ex  C[1][2]->C[2][1]  C[2][1]->C[1][1]
        movl %edx, %r10d         # r10d = N
        movq %r10, %r11          # r11 = N
        imull %ecx, %r10d        # r10 = N * i
        addl %r8d, %r10d         # r10 = N * i + j
        imull $1, %r10d          # r10 = L * (N * i + j )
        addq %rsi, %r10          # r10 = C + L * (N * i + j)  ex. C[1][2]
        imull %r8d, %r11d        # r11 = N * j
        addl %ecx, %r11d         # r11 = N * j + i
        imull $1, %r11d          # r11 = L * (N * i + j )
        addq %rsi, %r11          # r11 = C + L * (N * j + i)  ex. C[2][1]

    # Copy the r10 into the temp value which sotres the value. Then swap two value
    # C [ L * (N * i + j) ] = C [ L * (N * j + i) ]

        movb (%r10), %r9b        # temp1 = r10 = C [ L * (N * i + j) ]
        movb (%r11), %r15b       # temp2 = r11 = C [ L * (N * j + i) ]
        movb %r15b, (%r10)       # C [ L * (N * i + j) ] = C [ L * (N * i + j) ]
        movb %r9b, (%r11)        # C [ L * (N * j + i) ] = C [ L * (N * j + i) ]

        incl %ecx                # increase the number of i (row)
        jmp rowLoops             # go to the loop of row

    finishWithRows:
        incl %r8d                # increase the number if j (column)
        jmp columnLoops          # go to the loop for col

    finishWithColumns:
        ret                      # finish all tasks and return


    #####################
        .globl    reverseColumns
    reverseColumns:
    # A in rdi, C in rsi, N in edx, i (colunm)in rcx, j (roll) in r8
        xorl %eax, %eax           # set the return value to zero
        xorl %ecx, %ecx           # set the ecx value to zero
        movl %edx, %ebx           # move the value N into the stack
        subl $2, %ebx             # Decrease the value N to N - 2
        

    .L3:
        movl $0, %r8d             # set r8 to the value of zero (the value of j )
        cmpl %ebx, %ecx           # go to the loop as long as i < (N - 2)
        jge .L4                   # if it is greater or equal then jump tp L4

    .L1:
        cmpl %ebx, %r8d           # go to the loop as long as j < (N - 2 )
        jge .L2                   # go to the loop L2 if greater or equal

        
        movl %edx, %r10d          # r10 = N
        imull %ecx, %r10d         # r10 = N * i
        movq %r10, %r11           # r11 = i * N
        addl %r8d, %r10d          # r10 = N * i + j
        imull $1, %r10d           # r10 = 1 * (j + i * N)
        addq %rsi, %r10           # r10 = C + 1 * (j + i * N)
        addl %edx, %r11d          # r11 = i * N + N
        subl %ecx, %r11d          # r11 = i * N + N - i
        subl $1, %r11d            # r11 = i * N + N - i - 1
        imull $1, %r11d           # r11 = 1 * ( i * N + N - i - 1 )
        addq %rsi, %r11           # r11 = C + 1 * ( i * N + N - i - 1 )

    # Copy the C + 1 * (j + i * N) = C + 1 * ( i * N + N - i - 1 )

        movb (%r10), %r9b         # temp 1 = C + 1 * (j + i * N)
        movb (%r11), %r13b        # temp 2 = C + 1 * ( i * N + N - i - 1 )
        movb %r13b, (%r10)        # C + 1 * (j + i * N) = C + 1 * ( i * N + N - i - 1 )=temp2
        movb %r9b, (%r11)         # C + 1 * ( i * N + N - i - 1 ) = temp1

        incl %r8d                 # increase the j++
        jmp .L1                   # jump to the L1

    .L2:
        incl %ecx                 # increase the value of i, i++
        jmp .L3                   # jump to the L3

    .L4:
        ret                       # finish all task then return


