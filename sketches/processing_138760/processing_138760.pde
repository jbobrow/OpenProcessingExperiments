
int N=0;
int M=2;
int I=1;
int X = M+I;
int L=M;
int J;
float p=1;
float q=1;

size(480,480);
background(255,255,255);

while(N<20) {
 J=0;
 for ( int a=1; a<M+1; a++)
 {
 J=J+1
 L=L-0;
 }
 L= L + I;
 line(40*N,height-X,40*(N+1),height-{L+J});
 X=L+J;
 M=L;
 I=J;
 N=N+1;
 }
