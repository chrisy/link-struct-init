
CC=gcc
CFLAGS=-Wall -Werror
LDFLAGS=-Wall -Werror

all: a b

a: a.o b.o
	gcc -o $@ $^

b: b.o a.o
	gcc -o $@ $^

a.o: a.c
b.o: b.c

.PHONY: clean
clean:
	rm -f a b a.o b.o
