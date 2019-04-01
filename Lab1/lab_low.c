  // This is also in a high-level language
  // but every line corresponds to an assembly instruction
  max = x;
  tmp = x;
  tmp = tmp < y;
  if(tmp == 0) goto CHECK; // this is equivalent to a BranchOnZero (BZJ) instruction
  max = y;

CHECK:
    tmp = max;
    tmp = tmp < z;
    if(tmp == 0) goto END;
    max = z;


END:
  goto END;
