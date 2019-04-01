0: BZJi 1 0
1: 9

//CODE 3
9: CP 80 200 // move the args
10: CPi 81 0 // move the args
11: CPi 64 13 //set jumpback pointer
12: BZJi 49 0 // call the equal func
13: CP 101 62 //copy the return value to 101
14: BZJ 28 101 // is equal to 0? jump to 17
15: CPi 202 0 // Z = 0
16: BZJi 27 0 // jump to END

17: CP 80 200 // move the args
18: CPi 81 1 // move the args
19: CPi 64 21 // set the jumpback pointer
20: BZJi 49 0 // call the equal func
21: CP 101 62 // copy the return value to 101
22: BZJ 29 101 // is equal to 1? jump to 25
23: CPi 202 1
24: BZJi 27 0 //jump to END

25: CP 202 201
26: BZJi 27 0 //END

27: 26


28: 17
29: 25


//equal func.
49: 50 // func pointer
50: CP 70 80 // tmp a
51: CP 71 81 // tmp b
52: LT 70 71
53: BZJ 72 70 // if(a<b) goto step2
54: CPi 62 0 // return 0
55: BZJi 74 0 // end func.
56: CP 70 80
57: LT 71 70
58: BZJ 73 71 // if(b<a) goto step3
59: CPi 62 0 //return 0
60: BZJi 74 0 //end func
61: CPi 62 1 //return 1
//62: return value pointer
63: BZJi 64 0 //endfunc pointer
//64:Jump back pointer

72: 56//step2 jump
73: 61//step3 jump
74: 63

//70-75 tmp for equal func.
//for equal func.
//80: a
//81: b


200: 500//x
201: 400//y
202: 12//z
