       identification division.
       program-id. Doublechar.
       data division.
      
       linkage section.
       01  s.
           03  sLen         pic 9(2).
           03  sChar        pic x
               occurs 0 to 30 times depending on sLen indexed i.
       01  result.
           03  resLen       pic 9(2).
           03  resChar      pic x
               occurs 0 to 60 times depending on resLen.
      
       procedure division using s result.
      
          initialize result
           DISPLAY 'sLen: ' sLen.
           multiply sLen by 2 giving resLen
           DISPLAY 'rLen: ' resLen.
           perform varying i from 1 until i > sLen
              move sChar(i) to resChar(2 * i - 1) resChar(2 * i)
           end-perform.
          goback.
       end program Doublechar.