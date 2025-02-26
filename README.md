"# Cobol" 
Programa Caracteres Duplicados
Este código en COBOL toma una cadena (`MI-CADENA`), **duplica cada uno de sus caracteres** y almacena el resultado en `RESULTADO`. Finalmente, muestra la nueva cadena con los caracteres duplicados.  

---

## IDENTIFICATION DIVISION
Define el nombre del programa:
```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DuplicarCaracteres.
```

---

## DATA DIVISION
Aquí se declaran las variables que se utilizarán en el programa.

### Definición de variables
```cobol
01 MI-CADENA       PIC X(20) VALUE 'Hello World'.
```
- `MI-CADENA`: Contiene la cadena original con un máximo de **20 caracteres**.

```cobol
01 LONGITUD        PIC 9(02).
```
- `LONGITUD`: Almacena la **longitud real** de `MI-CADENA`.

```cobol
01 INDICE          PIC 9(02) VALUE 1.
```
- `INDICE`: Se usa como **contador** para recorrer la cadena original.

```cobol
01 RESULTADO       PIC X(40) VALUE SPACES.
```
- `RESULTADO`: Almacena la nueva cadena con los caracteres **duplicados**. Tiene el doble del tamaño de `MI-CADENA` (hasta 40 caracteres).

```cobol
01 POS-RES         PIC 9(02) VALUE 1.
```
- `POS-RES`: Indica la **posición actual** dentro de `RESULTADO`.

```cobol
01 CARACTER        PIC X.
```
- `CARACTER`: Variable temporal para almacenar un carácter individual.

---

## PROCEDURE DIVISION
Define la lógica del programa.

### Obtener la longitud de la cadena original
```cobol
MOVE FUNCTION LENGTH(MI-CADENA) TO LONGITUD.
```
- La función `LENGTH(MI-CADENA)` obtiene la **cantidad de caracteres** de la cadena y la almacena en `LONGITUD`.

### Duplicar caracteres usando un bucle
```cobol
PERFORM VARYING INDICE FROM 1 BY 1 UNTIL INDICE > LONGITUD
```
- Un **bucle** que recorre `MI-CADENA` desde el **índice 1** hasta `LONGITUD`.

Dentro del bucle:
```cobol
MOVE MI-CADENA(INDICE:1) TO CARACTER
```
- Toma **un carácter** de `MI-CADENA` en la posición `INDICE` y lo guarda en `CARACTER`.

```cobol
MOVE CARACTER TO RESULTADO(POS-RES:1)
ADD 1 TO POS-RES
```
- Mueve el **carácter original** a `RESULTADO` en la posición actual.
- Aumenta `POS-RES` en **1** para la siguiente posición.

```cobol
MOVE CARACTER TO RESULTADO(POS-RES:1)
ADD 1 TO POS-RES
```
- Vuelve a mover el **mismo carácter** a `RESULTADO` (lo **duplica**).
- Aumenta `POS-RES` en **1** nuevamente.

El bucle continúa hasta recorrer toda la cadena original.

---

## Mostrar el resultado
```cobol
DISPLAY 'Resultado: ' RESULTADO.
```
- Muestra la nueva cadena con los caracteres **duplicados**.

```cobol
STOP RUN.
```
- Finaliza el programa.

---

## Ejemplo de Ejecución

### Entrada:
```cobol
MI-CADENA = "Hello World"
```

### Proceso:
Cada carácter se duplica:
```
H -> HH
e -> ee
l -> ll
l -> ll
o -> oo
(space) -> (space)(space)
W -> WW
o -> oo
r -> rr
l -> ll
d -> dd
```

### Salida:
```
Resultado: HHeelllloo  WWoorrlldd
```

---

## Resumen
✅ **Toma una cadena y duplica cada uno de sus caracteres.**  
✅ **Utiliza un bucle `PERFORM` para recorrer la cadena.**  
✅ **Usa `FUNCTION LENGTH()` para calcular la longitud de la cadena.**  

Si necesitas modificarlo o entender algún detalle más, dime. 😊



## RemoveChar
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


