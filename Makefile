CC=clang
CFLAGS=-O3 -march=native -g -flto -DNDEBUG

SRC=src/bits.c src/movegen.c src/position.c src/text.c
OBJ=bits.o movegen.o position.o text.o
LIB=libuchess.a

WARNINGS=-Wall -Wextra -pedantic -std=c99
IGNORE=-Wno-missing-field-initializers -Wno-gnu-binary-literal
WARNINGS+=$(IGNORE)

default: $(LIB)

unittest:
	$(CC) -o $@ $(SRC) src/unittest.c $(CFLAGS) $(WARNINGS)
	./$@

$(LIB):
	$(CC) -c $(SRC) $(CFLAGS) $(WARNINGS)
	ar rcs $(LIB) $(OBJ)

clean:
	rm -rf $(OBJ)
	rm -rf $(LIB)
	rm -rf unittest
