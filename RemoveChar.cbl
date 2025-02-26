       identification division.
       program-id. removeChar.
       data division.

       linkage section.
       01  str.
           05 s-length     pic 9(2).
           05 s-char       pic x occurs 2 to 20 times 
                                  depending on s-length.
       01  result.
           05 res-length   pic 9(2).
           05 res          pic x occurs 0 to 20 times 
                                 depending on res-length.
      
       procedure division using str result.
      
          initialize result
          compute res-length = s-length - 2
          move str(4:) to result(3:)
          goback.
       end program removeChar.