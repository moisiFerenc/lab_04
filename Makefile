# Makefile a Labor 4 feladatokhoz

CC = gcc
CFLAGS = -Wall -Wextra -g -pthread
VALGRIND = valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes

# Minden cel
all: feladat_01 feladat_02 feladat_03 feladat_04 feladat_05 feladat_06

# Feladat 01: Race condition
feladat_01: feladat_01/solution.c
	$(CC) $(CFLAGS) -o feladat_01 feladat_01/solution.c

# Feladat 02: Mutex
feladat_02: feladat_02/solution.c
	$(CC) $(CFLAGS) -o feladat_02 feladat_02/solution.c

# Feladat 03: Parhuzamos kereses
feladat_03: feladat_03/solution.c
	$(CC) $(CFLAGS) -o feladat_03 feladat_03/solution.c

# Feladat 04: Valgrind (buggy verzio)
feladat_04: feladat_04/buggy.c
	$(CC) $(CFLAGS) -o feladat_04 feladat_04/buggy.c

# Feladat 04: Megoldas
feladat_04_sol: feladat_04/solution.c
	$(CC) $(CFLAGS) -o feladat_04 feladat_04/solution.c

# Feladat 05: Realloc
feladat_05: feladat_05/solution.c
	$(CC) $(CFLAGS) -o feladat_05 feladat_05/solution.c

# Feladat 06: Segfault (buggy verzio)
feladat_06: feladat_06/buggy.c
	$(CC) $(CFLAGS) -o feladat_06 feladat_06/buggy.c

# Feladat 06: Megoldas
feladat_06_sol: feladat_06/solution.c
	$(CC) $(CFLAGS) -o feladat_06 feladat_06/solution.c

# Valgrind celok
valgrind_04: feladat_04
	$(VALGRIND) ./feladat_04

valgrind_04_sol: feladat_04_sol
	$(VALGRIND) ./feladat_04

valgrind_05: feladat_05
	$(VALGRIND) ./feladat_05

valgrind_06: feladat_06_sol
	$(VALGRIND) ./feladat_06

# Tisztitas
clean:
	rm -f feladat_01 feladat_02 feladat_03 feladat_04 feladat_05 feladat_06
	rm -f *.o
	rm -f vgcore.*

# Help
help:
	@echo "Labor 4 - Makefile"
	@echo "=================="
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
	@echo "  make valgrind_04      - Feladat 04 Valgrind ellen)"
	@echo "  make valgrind_04_sol  - Feladat 04 megoldas Valgrind ellen)"
	@echo "  make valgrind_05      - Feladat 05 Valgrind ellenorzes)"
	@echo "  make valgrind_06      - Feladat 06 megoldas Valgrind ellen)"
	@echo ""
	@echo "Egyeb:"
	@echo "  make clean         - Forditott fajlok torlese"
	@echo "  make help          - Ez a sugo"

.PHONY: all clean help valgrind_04 valgrind_04_sol valgrind_05 valgrind_06
