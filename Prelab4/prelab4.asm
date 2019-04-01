0: CPi 101 3 // int i = 3
1: CP 134 102 // temp = k
2: LT 134 2000 // temp = k < N
3: BZJ 15 134 // if(temp == 0) go to end
4: CPi 70 12 // return = 12
5: CPi 135 2001 // temp2 = start of array
6: ADD 135 102  // temp2 = location of kth element
7: CPi 301 101 // pass adress of i to 301
8: CPi 302 102 // pass adress of k to 302 
9: CP 303 135 // pass &L[k] to 303
10: CP 133 135
11: BZJi 399 0 // go to func
12: ADDi 102 1 // increment k by 1
13: BZJi 86 0 // return to loop
14: BZJi 15 0
15: 14


//power func
399: 400 //func pointer
400: CPi 303 1 // *out = 1
401: BZJ 84 302 // if(*X== 0) goto
402: CP 136 500 // temp3 = k
403: CPI 138 302 // temp 4 = value in 302
404: LT 136 138 // k(temp) < *X
405: BZJ 84 136 // if (temp == 0) return
406: CPI 137 301 // *137 = value of j
407: MUL 303 137 // *out = *out * (*j)
408: ADDi 500 1  // increment k
409: BZJi 85 0 // goto loop
410: CPi 500 0 // k = 0
411: CPIi 133 303 
412: BZJi 70 0 // return






84: 410
85: 402
86: 1
102: 0 // counter = k
500: 0 // counter = k 2
2000: 8
