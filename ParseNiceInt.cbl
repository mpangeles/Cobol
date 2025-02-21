identification division.
       program-id. GetAge.
      
       data division.

       linkage section.
       01 age         pic x(11).
       01 result      pic 9.
      
       procedure division using age result.
      
          initialize result
          move age(1:1) to result.
          goback.
       end program GetAge.