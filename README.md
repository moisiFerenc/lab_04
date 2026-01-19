# Labor 4: Szalkezeles es Memoriakezeles

## Bevezetes

Ez a labor ket fo temakort olel fel:
- **Szalkezeles (Multithreading)**: Parhuzamos vegrehajtasi problemak es megoldasok
- **Memoriakezeles**: Dinamikus memoria helyes hasznalata es hibakereseEs

## Elokovetelmények

A feladatok megoldasahoz szukseg van:
- GCC fordito pthread tamogatassal
- Valgrind memoria ellenorzo eszkoz
- GDB debugger (opcionalis, de ajanlott)

### Telepites Ubuntu/Debian rendszeren:

```bash
sudo apt-get update
sudo apt-get install build-essential valgrind gdb
```

## Labor feladatok

### Szalkezeles feladatok

**Feladat 01: Race Condition Demonstralas**
- Tema: A parahuzamos iras veszelyei
- Konyvtar: `feladat_01/`
- Cel: Megerteni, hogy mi tortenik, ha tobb szal egyidoben ir ugyanarra a valtozora

**Feladat 02: Mutex Vedelem**
- Tema: A problema megoldasa zarakkal
- Konyvtar: `feladat_02/`
- Cel: A race condition kijavitasa mutex hasznalataval

**Feladat 03: Parhuzamos Kereses**
- Tema: Szalak kozotti koordinacio
- Konyvtar: `feladat_03/`
- Cel: Nagy adathalmaz parhuzamos feldolgozasa, szalak leallitasa talalat eseten

### Memoriakezeles feladatok

**Feladat 04: Valgrind es Memory Leaks**
- Tema: Memoria szivargas felderitese
- Konyvtar: `feladat_04/`
- Cel: Hibas kod javitasa valgrind segitsegevel

**Feladat 05: Dinamikus Tomb Realloc**
- Tema: Memoria ujrafoglalas helyes kezelese
- Konyvtar: `feladat_06/`
- Cel: A realloc fuggveny helyes hasznalata es hibakezelese

**Feladat 06: Segmentation Fault Debugging**
- Tema: Memoria hozzaferesi hibak
- Konyvtar: `feladat_06/`
- Cel: Memoria hibak okozasa es felderitese debuggerrel

## Forditasi utmutato

### Osszes feladat forditasa:

```bash
make all
```

### Egyedi feladat forditasa:

```bash
make feladat_01
make feladat_02
# stb.
```

### Tisztitas:

```bash
make clean
```

### Valgrind futtatasa:

```bash
make valgrind_04
make valgrind_05
# stb.
```

## Altalanos tanacsok

1. **Mindig forditsd `-Wall -Wextra` flagekkel** - Sok hibat mar forditas kozben elkap
2. **Hasznald a `-g` flaget** - Debug informaciokat ad a binarishoz
3. **Valgrind legyen a baratod** - Futtasd le minden memoriat hasznalo programon
4. **Race condition-ok nehezen reprodukalhatoak** - Ha egyszer jo az eredmeny, az meg nem jelenti, hogy helyes a kod
5. **Olvass el minden valgrind hibauzenetet** - Pontosan megmondja, hol van a problema

## Hasznos parancsok

### Program futtatasa valgrind-dal:

```bash
valgrind --leak-check=full ./feladat_04
```

### Program futtatasa GDB-vel:

```bash
gdb ./feladat_06
(gdb) run
(gdb) backtrace
```

### Thread hibak kereses:

```bash
valgrind --tool=helgrind ./feladat_01
```

## Tovbbi dokumentacio

- `docs/pthread_referencia.txt` - POSIX thread fuggvenyek gyorsreferencia
- `docs/valgrind_hasznalat.txt` - Valgrind parancsok es kimenet ertelmezese

## Megjegyzesek

A feladatok progressziv nehezseguek. Ajanlott a megadott sorrendben megoldani oket.
Egyes feladatok szandekosan hibas kodot tartalmaznak - ez reszed a tanulasi folyamatnak.
