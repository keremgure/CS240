//TEST CASE
0: CPi 200 1 //set 200 = 1
1: CPi 201 0 //set 201 = 1
2: CPi 202 7 //set 202 == 7

3: CPi 700 5 //set the jumpback pointer
4: BZJi 19 0 //call the bnj func

5: CPi 10 1 // set 1 if 200!=201
6: BZJi 9 0 //END

7: CPi 10 0 //set 0 if 200==201
8: BZJi 9 0 //END

9: 8



//bnj func.
19: 20 //function pointer

20: CP 80 200 //copy the args
21: CP 81 201 //copy the args
22: CPi 64 24 //jumpback pointer
23: BZJi 49 0 //call the equal func
24: CP 1000 62 //copy the return value

25: BZJ 202 1000 //jump if *1000==0
26: BZJi 700 0 //return back to *70



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




//return:700
//a: 200
//b: 201
//jump:202
