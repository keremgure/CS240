//FILL IN HERE
0: CPi 300 0 //i = index(0)
1: CP 301 300 //tmp = i //LOOP Start
2: CP 304 301 // index of operation
3: ADDi 304 101 // finalize IOO
4: CP 305 302 //index of smallest OP.
5: ADDi 305 101 // finalize SIOO
6: CPI 303 305 //smallestValue = a[smallestIndexOfOP]
7: LT 301 100 // tmp < SIZE
8: BZJ 19 301 // if(i<size) goto END
9: CPI 306 304 // tmp2 = a[i]
10: LT 306 303 // tmp2 < smallestValue
11: BZJ 20 306 // if(tmp2 < smallestValue) goto LOOP_END
12: CP 302 300 // smallestIndex = i
13: CPI 303 305 // smallestValue = a[smallestIndex]
14: ADDi 300 1 // i++
15: BZJi 18 0 //goto Loop Start
16: CP 250 302 //CP smallestIndex to 250
17: BZJi 21 0


18: 1 //Loop start
19: 16 // goto END
20: 14 //goto loop_end
21: 17


100: 25  // SIZE
101: 19  // first element of array 
102: 13
103: 22
104: 43
105: 35
106: 67
107: 58
108: 79
109: 18
110: 26
111: 33
112: 41
113: 51
114: 60
115: 81
116: 59
117: 63
118: 77
119: 83
120: 33
121: 44
122: 12
123: 99
124: 22
125: 21 // last element of array
250: 0 // FOUND SMALLEST INDEX

//300 i
//301 tmp of i
//302 smallestIndex
//303 smallestValue
//304 index of operation
