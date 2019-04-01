
// 300: 400 // stackPtr = *300
// 301: 0 // lastresut
// 500: 0 // result return

// 400: 4 // n_0
// 401: 0 // result val
// 402: 2 // pc_returnAddr
// ... 

stack[ptr] = n; // n
stack[ptr + 1] = 0; //return Val
stack[ptr + 2] = 3; // return Addr

TOP:

    if (stack[ptr] <= 1)
    {
        lastresult = stack[ptr];
        ptr = ptr - 3;
		goto stack[ptr+5];
    }
  //END_IF1  
    stack[ptr+3] = stack[ptr] - 1;
    stack[ptr+4] = 0;
    stack[ptr+5] = RETURNpt1;
    ptr = ptr + 3;
    goto TOP;

RETURNpt1:

    stack[ptr + 1] = lastresult;
    stack[ptr + 3] = stack[ptr] - 2;
    stack[ptr + 4] = 0;
    stack[ptr + 5] = RETURNpt2;
    ptr = ptr + 3;
    goto TOP;

RETURNpt2:

    lastresult += stack[ptr + 1];
    ptr = ptr - 3;
	goto stack[ptr+5];

END: goto END