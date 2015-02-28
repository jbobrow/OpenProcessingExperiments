
// Sierpinksi Carpet from Hadamard Matrix
// adapted to Processing by Tom Heath (2007) from BASIC code by R.L.Bagula (1998)

// n=iterations
int n = 5;
int b[][] = new int [int (pow(3,n))][n];
size(int (pow(3,n)),int (pow(3,n)));

// generate matrix
for (int i=0; i<pow(3,n); i++) {
  for (int k=0; k<n; k++) {
    b[i][k] = int(((i/pow(3,k) ) % 3 ) % 2 );    
  }
}

// draw results
for (int i=0; i<pow(3,n); i++) {
  for (int j=0; j<pow(3,n); j++) {
    int sum = 0;
    for (int k=0; k<n; k++) {
      sum += b[i][k] * b[j][k];
    }
    set(i,j,color((sum == 0) ? 0 : 255));
  }
}

/* Original BASIC code follows:
SET MODE "color"
SET WINDOW 0,1026,0,750
SET COLOR MIX(0) 1,1,1
SET COLOR MIX(1) 0,0,0
DECLARE DEF xorb
PRINT" Hadamard/Sylvester matrix as 0's and 1's as Sierpinski Carpet"
PRINT " input trinary power n:3^n maximum 37"
INPUT n
DIM b(0 to 2190,0 to 12)
FOR i= 0 to 3^n
   FOR k=0 to n
       LET b(i,k)=int(mod(mod(i/3^k,3),2))
   NEXT k
NEXT i
FOR i= 0 to 3^n
   IF i>1026 then EXIT FOR
   FOR j=0 to 3^n
       IF j> 750 then EXIT FOR
       LET sum =0
       FOR k=0 to n
           LET sum=sum +b(i,k)*b(j,k)
       NEXT k
       IF sum =0 then SET COLOR 1 else SET COLOR 0
       PLOT i,j
   NEXT j
NEXT i
SET COLOR 255
PRINT"  Hadamard/ Sylvester Matrix as 0's and 1's as Sierpinski Carpet"
PRINT"  By R. L. Bagula 7 Oct 1998©"
END
*/

