SFLAGS = -S -O2
OFLAGS = -g -c
CFLAGS = -o fac

all: fac

fac: main.o fact.o
	gcc $(CFLAGS) main.o fact.o

main.o:	main.s
	gcc $(OFLAGS) main.s

main.s:	main.c
	gcc $(SFLAGS) main.c

fact.o:	fact.s
	gcc $(OFLAGS) fact.s

clean:	
	rm -f fac *.o