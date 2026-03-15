.data
    ; Number 1: 12345678h (split into two 16-bit parts)
    num1_low  dw 5678h
    num1_high dw 1234h
    
    ; Number 2: 11112222h
    num2_low  dw 2222h
    num2_high dw 1111h
    
    ; Result storage
    res_low   dw ?
    res_high  dw ?