0: CP 130 120 // max = x
1: CP 134 120 // tmp = x
2: LT 134 121 // tmp = tmp < y
3: BZJ 6 134 // if(tmp == 0) goto END
4: CP 130 121 // max = y
5: BZJi 6 0  // goto END

6: 5

120: 220 // x
121: 37 // y

