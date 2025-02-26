"# Cobol" 
Programa Caracteres Duplicados
Este código en COBOL define un programa llamado Doublechar, que toma una cadena de entrada (s) y devuelve otra (result) en la que cada carácter se repite dos veces.

👉 IDENTIFICATION DIVISION

IDENTIFICATION DIVISION.
PROGRAM-ID. Doublechar.

Define el nombre del programa como Doublechar.

👉 DATA DIVISION

La DATA DIVISION contiene la estructura de los datos usados en el programa.

LINKAGE SECTION.
01  s.
    03  sLen         PIC 9(2).
    03  sChar        PIC X
        OCCURS 0 TO 30 TIMES DEPENDING ON sLen INDEXED i.
01  result.
    03  resLen       PIC 9(2).
    03  resChar      PIC X
        OCCURS 0 TO 60 TIMES DEPENDING ON resLen.

👉 Explicación de la LINKAGE SECTION

La LINKAGE SECTION se usa cuando el programa recibe datos externos, por ejemplo, desde otro programa o subprograma.

👉 Estructura de s (entrada)

sLen: Guarda la longitud de la cadena original (s).

sChar: Es un array de caracteres que puede contener hasta 30 caracteres, dependiendo del valor de sLen.

INDEXED i: Permite usar i como índice en los bucles.

👉 Estructura de result (salida)

resLen: Guarda la longitud de la nueva cadena (el doble de sLen).

resChar: Es un array que almacena la nueva cadena con caracteres duplicados, de hasta 60 caracteres (2 * sLen).

👉 PROCEDURE DIVISION

PROCEDURE DIVISION USING s result.

El programa usa (USING) las variables s y result, lo que indica que este código está diseñado como un subprograma llamado por otro programa principal.

INITIALIZE result

Limpia (resLen y resChar), asegurando que no haya valores residuales.

DISPLAY 'sLen: ' sLen.
MULTIPLY sLen BY 2 GIVING resLen
DISPLAY 'rLen: ' resLen.

Muestra el tamaño original de sLen.

Calcula la nueva longitud duplicándola (resLen = sLen * 2).

Muestra la nueva longitud (resLen).

PERFORM VARYING i FROM 1 UNTIL i > sLen
    MOVE sChar(i) TO resChar(2 * i - 1) resChar(2 * i)
END-PERFORM.

Usa un bucle PERFORM VARYING para recorrer cada carácter de sChar.

Copia cada carácter dos veces en resChar:

resChar(2 * i - 1): Primera copia del carácter original.

resChar(2 * i): Segunda copia del carácter original.

GOBACK.

Finaliza la ejecución y devuelve el control al programa que lo llamó.

👉 Ejemplo de Ejecución

Entrada (s):

sLen = 5
sChar = "Hello"

Proceso:

resLen = sLen * 2 = 10

resChar = "HHeelllloo"

Salida (result):

resLen = 10
resChar = "HHeelllloo"

👉 Conclusión

👉 Este programa duplica cada carácter de una cadena y la almacena en otra variable.👉 Está diseñado para ser llamado desde otro programa, gracias a la LINKAGE SECTION.👉 Usa arrays dinámicos con OCCURS ... DEPENDING ON.👉 Eficiente y claro, usando PERFORM VARYING para recorrer la cadena.

Entrada (s):

sLen = 5
sChar = "Hello"

Proceso:

resLen = sLen * 2 = 10

resChar = "HHeelllloo"

Salida (result):

resLen = 10
resChar = "HHeelllloo"

👉 Conclusión

👉 Este programa duplica cada carácter de una cadena y la almacena en otra variable.👉 Está diseñado para ser llamado desde otro programa, gracias a la LINKAGE SECTION.👉 Usa arrays dinámicos con OCCURS ... DEPENDING ON.👉 Eficiente y claro, usando PERFORM VARYING para recorrer la cadena.




Este código está escrito en COBOL y define un programa llamado `removeChar`. Su propósito es eliminar los dos primeros caracteres de una cadena de entrada (`str`) y almacenar el resultado en `result`.

---

## IDENTIFICATION DIVISION
Define el nombre del programa:
```cobol
       identification division.
       program-id. removeChar.
```

---

## DATA DIVISION
Define las variables que se utilizarán en el programa.

### LINKAGE SECTION
Contiene las variables que se recibirán como parámetros cuando se llame al programa.

#### Definición de la variable `str` (Entrada)
```cobol
       01  str.
           05 s-length     pic 9(2).
           05 s-char       pic x occurs 2 to 20 times
                                  depending on s-length.
```
- `s-length`: Indica la longitud de la cadena `s-char`.
- `s-char`: Es un **arreglo de caracteres** con un tamaño de **2 a 20**, según el valor de `s-length`.

#### Definición de la variable `result` (Salida)
```cobol
       01  result.
           05 res-length   pic 9(2).
           05 res          pic x occurs 0 to 20 times
                                 depending on res-length.
```
- `res-length`: Guardará la longitud del resultado (después de eliminar los 2 primeros caracteres).
- `res`: Contendrá la nueva cadena sin los dos primeros caracteres.

---

## PROCEDURE DIVISION
Define la lógica del programa:
```cobol
       procedure division using str result.
```
Indica que el programa recibe `str` como entrada y devuelve `result` como salida.

```cobol
       initialize result
```
Inicializa `result`, asegurando que todos los valores se establezcan en cero o espacios en blanco.

```cobol
       compute res-length = s-length - 2
```
Calcula la nueva longitud de la cadena después de eliminar los dos primeros caracteres.

```cobol
       move str(4:) to result(3:)
```
Esta línea intenta mover los caracteres desde la **posición 4 en adelante** de `str` hacia la posición **3 en adelante** de `result`.  
**Posible error**: COBOL generalmente no usa la notación `[:]`, por lo que esta línea podría no funcionar correctamente. Probablemente debería ser:
```cobol
       move s-char(3:) to res(1:)
```
Para mover la cadena desde la **posición 3 en adelante** de `s-char` a `res`.

```cobol
       goback.
```
Termina el programa y regresa al programa que lo llamó.

---

## Ejemplo de Entrada y Salida

### Entrada (`str`):
```
s-length = 10
s-char   = "ABCDEFGHIJ"
```
### Proceso:
- Se eliminan los dos primeros caracteres: `"ABCDEFGHIJ"` → `"CDEFGHIJ"`
- Nueva longitud: `10 - 2 = 8`

### Salida (`result`):
```
res-length = 8
res        = "CDEFGHIJ"
```

---

## Resumen
✅ **Elimina los dos primeros caracteres de una cadena y devuelve el resultado.**  
❌ **Posible error en la sintaxis de la operación `move`**.  
Si necesitas ayuda para corregirlo o adaptarlo, avísame. 😊


