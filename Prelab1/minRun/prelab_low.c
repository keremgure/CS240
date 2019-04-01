  // This is also in a high-level language
  // but every line corresponds to an assembly instruction
  min = x;
  tmp = x;
  tmp = tmp < y;
  if(tmp == 0) goto NEXT; // this is equivalent to a BranchOnZero (BZJ) instruction
  goto END;
NEXT:
  min = y;
  goto END;

END:
  goto END;

