  // This is also in a high-level language
  // but every line corresponds to an assembly instruction
  min = x;
  tmp = x;
  tmp = tmp < y;
  if(tmp == 0) goto END; // this is equivalent to a BranchOnZero (BZJ) instruction
  min = y;
END:
  goto END;
