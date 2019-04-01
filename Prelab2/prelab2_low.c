SIZE= 10;
a[SIZE];
a[0] = 9;
a[1] = 1;
a[2] = 2;
a[3] = 4;
a[4] = 3;
a[5] = 8;
a[6] = 7;
a[7] = 6;
a[8] = 5;
a[9] = 0;

k = 0;
m = 0;
temp = 0;

MAIN:
flag = (k < SIZE);
if(flag == 0) goto SKIP;
    m = 0;
    SUB1:
    flag2 = (m<SIZE-k-1);
    if(flag2 == 0) goto SKIP2;
        flag3 = (a[m+1] < a[m]);
        if(flag3==0) goto SKIP3;
            temp = a[m];
            a[m] = a[m+1];
            a[m+1] = temp;
        SKIP3:
            m = m+1;
            goto SUB1;


        
    SKIP2:
       k = k+1;
       goto MAIN;

SKIP: goto END;
END: goto SKIP;