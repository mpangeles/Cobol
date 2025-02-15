*The cockroach is one of the fastest insects. Write a function which takes its speed in km per hour and returns it in cm per second, rounded down to the integer (= floored).
*For example:
*1.08 --> 30
*Note! The input is a Real number (actual type is language dependent) and is >= 0. The result should be an Integer.
    IDENTIFICATION DIVISION.
       PROGRAM-ID. COCKROACH-SPEED.
       DATA DIVISION.
       LINKAGE SECTION.
       01 SPEED       PIC 9V9(2).
       01 RESULT      PIC 9(2).
       PROCEDURE DIVISION USING SPEED RESULT.

      * 1 km/h == 27.778 cm/s
          MULTIPLY SPEED BY 27.778 GIVING RESULT
          
          GOBACK.

       END PROGRAM COCKROACH-SPEED.