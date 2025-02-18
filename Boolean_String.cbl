*Implement a function which convert the given boolean value into its string representation.
    identification division.
       program-id. BooleanToString.
       data division.
       linkage section.
       01 b           pic 9.
          88 bool     value 1.
       01 result      pic a(5).
      
       procedure division using b result.
          initialize result
            IF b = 1 THEN
               MOVE "true" TO result
            ELSE
               MOVE "false" TO result
            END-IF.
          goback.
       end program BooleanToString.
      