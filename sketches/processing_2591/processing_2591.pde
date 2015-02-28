
// Sierpinski Carpet from Iterated Function System
// adapted to Processing by Tom Heath (2007) from BASIC code by R.L.Bagula (1994)

// m=attractor type
// n=iterations
// s=size
int m = 4;
int n = 1000000;
int s = int(pow(3,5));

size(s,s);

float lastX=1, lastY=1, x, y;
float a[] = new float[2*m];
float b[] = new float[2*m];
int q;

for (int i=0; i<m; i++){
  a[2*i]=cos(TWO_PI * i/m);
  a[2*i+1]=(a[2*i] + cos(TWO_PI * (i-1)/m)) / 2;
  b[2*i]=sin(TWO_PI * i/m);
  b[2*i+1]=(b[2*i] + sin(TWO_PI * (i-1)/m)) / 2;
}

background(255);

translate(width/2, height/2);
rotate(PI/4);
scale(s*0.47);

for (int i=0; i<n; i++) {
  q = int(random(2*m));
  x = lastX/3 + a[q];
  y = lastY/3 + b[q];
  point(x, y);
  lastX = x;
  lastY = y;
}

/* Original BASIC code follows:
 PRINT "input Sierpinski number 3 to 12"
 INPUT m
 SET MODE "color"
 SET WINDOW 0,1920,0,1024
 FOR i=0 to 15
 LET j=i/15
 SET COLOR MIX (i) j,1-j, 1-j
 NEXT i
 SET BACKGROUND COLOR "white"
 LET x=1
 LET y=1
 LET c=0
 LET s1=500
 LET s2 =s1*1024/1920
 DIM a(25),b(25)
 FOR i=1 to m
 LET a(2*i-1)=cos(2*pi*i/m)
 LET b(2*i-1)=sin(2*pi*i/m)
 NEXT i
 FOR i=1 to m
 LET a(2*i)=(cos(2*pi*i/m)+cos(2*pi*(i-1)/m))/2
 LET b(2*i)=(sin(2*pi*i/m)+sin(2*pi*(i-1)/m))/2
 NEXT i
 PRINT "GENERAL SIERPINSKI I.F.S. of second kind ( Sierpinski carpet class)"
 PRINT "BY R.L.BAGULA NOV 1994 copy rights reserved"
 RANDOMIZE
 PRINT " M=";m;" S=";" ";LOG(2*m)/LOG(3)
 FOR n= 1  TO  2560000
 LET c =RND
 LET l=1+Int(2*c*m)
 LET x1=x/3+a(l)
 LET y1=y/3+b(l)
 LET x=x1
 LET y=y1
 SET COLOR 128- mod(int(2*m*c), 255)
 IF n>10 THEN PLOT 1920/2+s1*x,1024/2+s2*y
 NEXT n
 END
 */






