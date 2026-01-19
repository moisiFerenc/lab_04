# Makefile a Labor 4 feladatokhoz

CC = gcc
CFLAGS = -Wall -Wextra -g -pthread
VALGRIND = valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes

# Binaris nevek (build/ mappaba)
BIN_01 = build/feladat_01
BIN_02 = build/feladat_02
BIN_03 = build/feladat_03
BIN_04 = build/feladat_04
BIN_05 = build/feladat_05
BIN_06 = build/feladat_06

# Minden cel
all: build feladat_01 feladat_02 feladat_03 feladat_04 feladat_05 feladat_06

# Build mappa letrehozasa
build:
	mkdir -p build

# Feladat 01: Race condition
feladat_01: $(BIN_01)
$(BIN_01): feladat_01/starter.c | build
	$(CC) $(CFLAGS) -o $(BIN_01) feladat_01/starter.c

# Feladat 02: Mutex
feladat_02: $(BIN_02)
$(BIN_02): feladat_02/starter.c | build
	$(CC) $(CFLAGS) -o $(BIN_02) feladat_02/starter.c

# Feladat 03: Parhuzamos kereses
feladat_03: $(BIN_03)
$(BIN_03): feladat_03/starter.c | build
	$(CC) $(CFLAGS) -o $(BIN_03) feladat_03/starter.c

# Feladat 04: Valgrind (buggy verzio)
feladat_04: $(BIN_04)
$(BIN_04): feladat_04/buggy.c | build
	$(CC) $(CFLAGS) -o $(BIN_04) feladat_04/buggy.c

# Feladat 05: Realloc
feladat_05: $(BIN_05)
$(BIN_05): feladat_05/starter.c | build
	$(CC) $(CFLAGS) -o $(BIN_05) feladat_05/starter.c

# Feladat 06: Segfault (buggy verzio)
feladat_06: $(BIN_06)
$(BIN_06): feladat_06/buggy.c | build
	$(CC) $(CFLAGS) -o $(BIN_06) feladat_06/buggy.c

# Valgrind celok
valgrind_04: feladat_04
	$(VALGRIND) $(BIN_04)

valgrind_05: feladat_05
	$(VALGRIND) $(BIN_05)

valgrind_06: feladat_06
	$(VALGRIND) $(BIN_06)

# Tisztitas
clean:
	rm -rf build/
	rm -f *.o
	rm -f vgcore.*

help:
	@echo "Labor 4 - Makefile"
	@echo "=================="
	@echo ""
	@echo "MEGJEGYZES: A starter.c fajlok NEM fordulnak le (TODO-k vannak bennuk)."
	@echo "Toltsd ki a feladatokat, majd futtasd a make parancsokat."
	@echo ""
	@echo "Forditasi celok:"
	@echo "  make all           - Minden feladat forditasa"
	@echo "  make feladat_01    - Feladat 01 (Race condition)"
	@echo "  make feladat_02    - Feladat 02 (Mutex)"
	@echo "  make feladat_03    - Feladat 03 (Parhuzamos kereses)"
	@echo "  make feladat_04    - Feladat 04 (Valgrind - buggy)"
	@echo "  make feladat_05    - Feladat 05 (Realloc)"
	@echo "  make feladat_06    - Feladat 06 (Segfault - buggy)"
	@echo ""
	@echo "Valgrind celok:"
	@echo "  make valgrind_04      - Feladat 04 Valgrind ellenorzes"
	@echo "  make valgrind_05      - Feladat 05 Valgrind ellenorzes"
	@echo "  make valgrind_06      - Feladat 06 Valgrind ellenorzes"
	@echo ""
	@echo "Egyeb:"
	@echo "  make clean         - Forditott fajlok torlese"
	@echo "  make help          - Ez a sugo"
	@echo ""
	@echo "A forditott binarisok a build/ mappaban lesznek."

.PHONY: all clean help build valgrind_04 valgrind_05 valgrind_06
