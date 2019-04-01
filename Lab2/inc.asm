0: CP 203 201 // offset copy

1: LT 203 300 //for cond.
2: BZJ 400 203 //for jump

3: CPi 200 100 // index = 100
4: ADD 200 201 // index = index + offset
5: CPI 202 200 // *temp = **index
6: ADDi 202 1 // *temp++
7: CPIi 200 202 // **200 = *202
8: ADDi 201 1 // offset++
9: BZJi 401 0 //for loop jump back

10: BZJi 400 0 //END




100: 90 //a[0]
101: 95 // a[1]

//200: index 
201: 0 //offset
//202: temp
//203: offset copy

300: 2 //size

400: 10 //end pointer
401: 0 // for loop pointer
