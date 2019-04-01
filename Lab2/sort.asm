0: CP 50 100   // *50 = k   WHILE1
1: LT 50 200  // if(k < SIZE)
2: BZJ 80 50  // PC++  (continue to loop or break)
3: CPi 101 0   // m = 0
4: CP 40 100   // *40 = k   WHILE2 
5: NAND 40 40 // -k-1
6: ADD 40 200 // SIZE-k-1
7: CP 60 101   // *40 = m
8: LT 60 40   // if(m < SIZE-k-1)
9: BZJ 81 60  // PC++ (continue to loop or break)

10: CP 36 79 // *36 = a 
11: ADD 36 101 // *36 = a+m
12: CPI 37 36 // *37 = *(a+m)
13: CP 39 36 // *39 = a+m
14: ADDi 39 1 // *39 = a+m+1
15: CPI 38 39 // *38 = *(a+m+1)
16: LT 37 38// (*(a+m) < *(a+m+1))
17: BZJ 83 37// if goto INC_m;

18: CPI 97 36// *97 = *(a+m) 
19: CPI 98 39// *98 = *(a+m+1)
20: CPIi 36 98// *(a+m) = *98
21: CPIi 39 97// *(a+m+1) = *97

22: BZJi 83 0// jump to 55

55: ADDi 101 1
56: BZJi 82 4  // goto WHILE2

70: ADDi 100 1  // END_WHILE2 + INC_k
71: BZJi 82 0  // goto WHILE1


80: 2
81: 70
82: 0
83: 55
97: 0          // temp
98: 0          // temp2

79: 201  // a (start address of array)

100: 0   // k 
101: 0   // m

130: BZJi 131 0   // END_WHILE1, also end of program
131: 130

200: 10  // SIZE
201: 9   // first element of array 
202: 1   
203: 2
204: 4
205: 3
206: 7
207: 5
208: 0
209: 8
210: 6   // last element of array

