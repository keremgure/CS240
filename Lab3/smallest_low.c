int size = 25;
int i = 0;
int smallestIndex = 0;
int smallest = a[smallestIndex];
while(i<size){
    if(a[i]<smallest){
        smallest = i;
    }
    i++;
}