// Kendi kodu FAJAR baktı
0: CP 1000 299 //tmp = ptr
1: ADD 1000 300 //add stack address
2: CPI 1001 1000 //get stack[ptr] value
3: LTi 1001 2 // stack[ptr] <= 1. stack[ptr] < 2

4: BZJ 250 1001 //if(stack[ptr] <= 1) goto END_IF1
5: CP 1000 299 //tmp = ptr
6: ADD 1000 300 //add stack address
7: CPI 301 1000 // lastresult = stack[ptr]

8: CP 1001 298 //tmp2 = 3
9: NAND 1001 1001
10: ADDi 1001 1 // -3
11: ADD 299 1001 // ptr = ptr - 3

12: CP 1000 299 //tmp = ptr
13: ADD 1000 300 //add stack address
14: ADDi 1000 5 //stack[ptr+5]
15: CPI 1001 1000 //get stack[ptr+5] value
16: BZJi 1001 0 //jump to stack[ptr+5]

//END_IF1
17: CP 1000 299 //tmp=ptr
18: ADD 1000 300 //add stack pointer
19: ADDi 1000 3 //stack[ptr+3]
20: CP 1001 299 //tmp2 = ptr
21: ADD 1001 300 //add stack pointer stack[ptr]
22: CPI 1002 1001 // get stack[ptr] value
23: CP 1003 297 //tmp3
24: NAND 1003 1003
25: ADDi 1003 1 // -1
26: ADD 1002 1003 //stack[ptr] - 1
27: CPIi 1000 1002 // stack[ptr+3] = stack[ptr] - 1

28: CP 1000 299 //tmp = ptr
29: ADD 1000 300 //add stack pointer
30: ADDi 1000 4 // stack[ptr+4]
31: CPIi 1000 296 // stack[ptr+4] = 0

32: CP 1000 299 //tmp = ptr
33: ADD 1000 300 //add stack pointer
34: ADDi 1000 5 //stack[ptr+5]
35: CPIi 1000 38 //stack[ptr+5] = RETURNpt1

36: ADDi 299 3
37: BZJi 296 0 //goto TOP

38: 39 //RETURNpt1
39: CP 1000 299 //tmp = ptr
40: ADD 1000 300 //add stack pointer
41: ADDi 1000 1 //stack[ptr+1]
42: CPIi 1000 301 // stack[ptr+1] = lastresult

43: CP 1000 299 //tmp = ptr
44: ADD 1000 300 //add stack pointer
45: ADDi 1000 3 //stack[ptr+3]
46: CP 1001 299 //tmp2 = ptr
47: ADD 1001 300 //add stack pointer
48: CPI 1002 1001 //get stack[ptr] value
49: CP 1003 295 //tmp3
50: NAND 1003 1003
51: ADDi 1003 1 // -2
52: ADD 1002 1003 //stack[ptr] - 2
53: CPIi 1000 1002 // stack[ptr+3] = stack[ptr] -2


54: CP 1000 299 //tmp = ptr
55: ADD 1000 300 //add stack pointer
56: ADDi 1000 4 //stack[ptr+4]
57: CPIi 1000 296 // stack[ptr+4] = 0

58: CP 1000 299 //tmp = ptr
59: ADD 1000 300// add stack pointer
60: ADDi 1000 5 //stack[ptr+5]
61: CPIi 1000 64 // stack[ptr+5] = RETURNpt2

62: ADDi 299 3 //ptr = ptr+3
63: BZJi 296 0 //goto TOP

64: 65 //RETURNpt2
65: CP 1000 299 //tmp = ptr
66: ADD 1000 300 //add stack pointer
67: ADDi 1000 1 //stack[ptr+1]
68: CPI 1001 1000 //get stack[ptr+1] value
69: ADD 301 1001 //lastresult += stack[ptr+1]

70: CP 1001 298 //tmp2 = 3
71: NAND 1001 1001
72: ADDi 1001 1 // -3
73: ADD 299 1001 // ptr = ptr - 3

74: CP 1000 299 //tmp = ptr
75: ADD 1000 300 //add stack pointer
76: ADDi 1000 5 //stack[ptr+5]
77: CPI 1001 1000 //get stack[ptr+5] value
78: BZJi 1001 0 //jump to stack[ptr+5]


79: CP 500 301
80: BZJi 81 0 //END
81: 80 //END Pointer



250: 17 //END_IF1 pointer


295: 2 //value 2 for subs use
296: 0 //TOP and set value
297: 1 // value 1 for subs use
298: 3 // value 3 for subs use
299: 0 //ptr
300: 400 //stackPointer
301: 0 //last result
500: 0 // result return pointer

400: 8 // n_0
401: 0 // result val
402: 79 // pc_returnAddr //TODO MAY CHANGE LATER
