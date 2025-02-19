       identification division.
       program-id. IsEven.

       data division.

       linkage section.
       01 n           pic s9(10)v9(2).
       01 result      pic 9.
       procedure division using n result.

          initialize result
      * `n` is a decimal number.
      * Assign `1` to result if `n` is even, otherwise `0`.
          compute result = 1 - function mod(n, 2).

          goback.
       end program IsEven.
