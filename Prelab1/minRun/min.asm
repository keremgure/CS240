0: CP 130 120 // min = x
1: CP 134 120 // tmp = x
2: LT 134 121 // tmp = tmp < y

3: BZJ 8 134 // if(tmp == 0) goto 5
4: BZJi 7 0 // goto END

5: CP 130 121 // min = y
6: BZJi 7 0  // END

7: 6
8: 5

120: 220 // x
121: 37 // y

