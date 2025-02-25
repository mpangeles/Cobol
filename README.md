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



