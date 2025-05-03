CC := gcc
CFLAGS := -Wall -Werror -g

TARGET := writer

CROSS_COMPILE ?= 
CC := $(CROSS_COMPILE)gcc

writer:writer.o
	$(CC) writer.o -o $(TARGET)

writer.o:writer.c
	$(CC) -c writer.c

clean:
	rm -f writer writer.o