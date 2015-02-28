
int N=0;
int M=2;
int I=1;
int X = M+I;
int L;
int J;
float l=0.4; 
float p=1;    
float q=1;    

size(480,480);
background(255,255,255);

while(N<20) {
 J=0;
 L=M;
 for ( int a=1; a<M+1; a++)
 {
 if (random(0,1)<l){
 J=J+1;
}
 if (random(0,1)>p){
 L=L-1;
 }
 }
 for (int b=1; b<I+1; b++);
 {
 if (random(0,1)>q{
 L=L-1;
 }
 }
 line(30*N,height-X,30*(N+1),height-{L+J});
 X=L+J;
 M=L;
 I=J;
 N=N+1;
 }
