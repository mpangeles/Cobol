 IDENTIFICATION DIVISION.
       PROGRAM-ID. RENTAL-CAR-COST.
       DATA DIVISION.
       LINKAGE SECTION.
       01 D           PIC 9(8).
       01 RESULT      PIC 9(10).
       PROCEDURE DIVISION USING D RESULT.
      * You can do it!!!
           MULTIPLY 40 BY D GIVING RESULT  
           IF D >= 3 AND D < 7 THEN
           SUBTRACT 20 FROM RESULT 
           END-IF.
           IF  D >= 7 THEN 
           SUBTRACT 50 FROM RESULT 
           END-IF.
          
           GOBACK.
       END PROGRAM RENTAL-CAR-COST.