
// Sierpinski Carpet from Pascal's Triangle
// adapted to Processing by Tom Heath (2007) from BASIC code by R.L.Bagula (1998)

// n=iterations
int n=5;
size(int(pow(3,n)),int(pow(3,n)));
float c = 2;
int c1;
float a[][] = new float [width][height];

a[0][0] = 1;
a[0][1] = 1;
a[1][0] = 1;
a[1][1] = c;

c1 = (c >= 2) ? int(c) : 2;

for (int i=2; i<width; i++) {
  a[i][0] = 1;
  for (int j=1; j<i; j++) {
    a[i][j] = ( a[i][j-1] + a[i-1][j] + a[i-1][j-1] ) % (c1+1);
    int colval = (a[i][j] > 0) ? 0 : 255;
    set(i-1,j,color(colval));
    set(j,i-1,color(colval));
  }
}

/* Original BASIC code follows:
SET MODE "COLOR"
SET WINDOW 0,1026,0,750
DIM A(0 TO 1026, 0 TO 1026)
PRINT "  general Pascal's triangle as modulo sum rule"
PRINT "  input a: 2 to 60 or 1/4 to 2 "
PRINT "  1"
PRINT "  1 1"
PRINT "  1 c   1"
PRINT "  1 1+c 1+c 1"
INPUT c
CLEAR
LET A(0,0)=1
LET A(O,1)=1
LET A(1,0)=1
LET A(1,1)=c
IF c>=2 then LET c1=int(c) else LET c1=2
FOR I= 2 TO INT(1026)
   FOR J= 1 TO I
       IF j>750 then EXIT FOR
       IF J-1 =0 THEN LET A(I,J-1)=1
       LET A(I,J)=MOD(A(I,J-1)+A(I-1,J)+A(I-1,J-1),c1+1)
       LET B=A(I,J)
       IF B>0 THEN SET COLOR MOD(256-2*B,256) ELSE SET COLOR 0
       IF J <=750 THEN PLOT  I,J

   NEXT J
NEXT I
SET COLOR 255
PRINT "  General Pascal's triangle of Sierpinski carpet level for ";c
PRINT "  by R. L. Bagula 29 Aug 1998 ©"
END
*/

