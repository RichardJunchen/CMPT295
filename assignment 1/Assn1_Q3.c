// Name: Junchen Li
// Student ID : 301385486

#include <stdio.h>
#include <stdlib.h>

typedef unsigned char *byte_pointer;

void show_bytes(byte_pointer start, size_t len)
{
    size_t i;
    printf("address = %p",start); // Print the address
    printf("\n");
    printf("0X");  // the hex form beign with 0X
    unsigned char *pointer_element=start; // use pointer go through every element start from first one
    for (i = 0; i<len; i++)
        printf("%.2x", *(pointer_element++));   //little endian
    printf("\n");
}
void show_int(int x) {
	printf("\nival = %d\n", x); 
    show_bytes((byte_pointer) &x, sizeof(int)); 
}

void show_float(float x) {
    printf("fval = %f\n", x); 	
    show_bytes((byte_pointer) &x, sizeof(float));
}

void show_pointer(void *x) {
	printf("pval = %p\n", x); 
    show_bytes((byte_pointer) &x, sizeof(void *));
}
void show_bits(int num)
{
    int numOFsize = sizeof(num)*8;//the total number of bits
    int i=numOFsize-1; // start with (size-1)
    for(;i>=0; i --)
        printf("%d", (num&(1<<i)) != 0); //change to the binary form by using the and sign
}
int mask_LSbits( int n )
{
    if (n<=0)
        return (0<<n);
    else if (n>=32)
        return ((1<<31));
     return((1<<n)-1);
}
