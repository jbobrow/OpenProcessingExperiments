
int N=0;
int M=2;
int I=1;
int X = M+I;
int L;
int J;
float p=1;
float q=1;

size(480,480);
background(255,255,255);

while(N<20) {
 J=0;
 for ( int a=1; a<M+1; a++)
 {
 k=random(0,1)
 if(k<0.5) {
 J=J;
 }
 else{
 J=J+2;
 }
 }
 L= floor(p*M) + floor(q*I);
 line(30*N,height-X,30*(N+1),height-{L+J});
 X=L+J;
 M=L;
 I=J;
 N=N+1;
 }
