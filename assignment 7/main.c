/*
 * Filename: main.c
 *
 * Purpose: Test driver for factorial function "fact()" 
 * 
 * Date: March 2020
 *
*/

#include <stdio.h>
#include <stdlib.h>

long fact(int n);

int main(int argc, char *argv[]) {
	int n = 0;
    long result = 0;
    int status = 0;  // all is well

	if (argc == 2) {
		n = atoi(argv[1]);

		printf("Calling fact(%d) ... ", n);
		result = fact(n);
		printf("and the result is %d! = %ld\n", n, result);
	
	} else {
	  	printf("Must supply 1 integer >= 0.\n");
		status = 1;  // reporting problem
	}

  return status;
}