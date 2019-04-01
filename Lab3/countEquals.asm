//FILL IN!
0: CP 500 90 //args copy
1: CP 501 91 //args copy
2: CP 70 50 //override jumpback pointer
3: BZJi 84 0 // jump to function
4: CP 1000 502 // copy the return value

5: CP 600 1000 //args copy
6: CP 70 51 //override jumpback
7: BZJi 85 0 //jump to func
8: CP 1001 601 // copy return value


9: NAND 1001 1001
10: ADDi 1001 1
11: ADD 52 1001
12: BZJi 13 0
13: 12




50: 4
51: 8
52: 14

70: 0//RETURN ADDRESS

80: 313//INTERNAL JUMP 1
81: 303//INTERNAL JUMP 2
84: 200//LOOP TO SUM
85: 300//LOOP TO COUNT1s


90: 3876
91: 43

110: 0 //number of same bits
//args 100 and 101
200: CP 100 500 //XOR ENTRY POINT, GET ARGUMENT 1 to 100
201: CP 101 501 //GET ARGUMENT 2 to 101 & OUTPUTS TO 502
202: CP 102 100
203: NAND 102 101
204: CP 103 100
205: NAND 103 102
206: CP 104 101
207: NAND 104 102
208: NAND 104 103
209: CP 502 104 //return value *502
210: BZJi 70 0 // return back to *70
//args 600
300: CP 200 600//COUNT1s ENTRY POINT, GET ARGUMENT 1 to 200 & OUTPUTS TO 601
301: CPi 100 0
302: CPi 601 0
303: CP 104 100 // temp = i	<-- LOOP
304: LTi 104 14 // temp = temp < 14 (operands 14 bits)
305: BZJ 70 104// if(!(i<N)) goto END
306: CP 104 200 // temp = argument
307: NANDi 104 1//AND  start
308: NAND 104 104//AND end
309: ADD 601 104
310: SRLi 200 1 // shift 1 right
311: ADDi 100 1 // i++
312: BZJi 81 0 // goto LOOP //601 return value
