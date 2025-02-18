*Given a string of digits, you should replace any digit below 5 with '0' and any digit 5 and above with '1'. Return the resulting string.

*Note: input will never be an empty string

 identification division.
       program-id. fakeBinary.    
       data division.
       linkage section.
       01  x.             
           03 x-length     pic 99.
           03 x-chars.    
               05 x-char   pic x occurs 0 to 30 times
                                depending on x-length. 
       01  result.
           03 res-length   pic 99.
           03 res-chars.
               05 res-char pic x occurs 0 to 30 times
                                 depending on res-length.  
       procedure division using x result.
      * your code here
       move x to result
           inspect res-chars converting "123456789" to "000011111".
       end program fakeBinary.