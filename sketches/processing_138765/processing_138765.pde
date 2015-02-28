
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

    std::tr1::uniform_int<int> unif(1, 10);
    std::cout << unif(eng) << std::endl;

while(N<20) {
 J=0;
 for ( int a=1; a<M+1; a++)
 {
 J=J+1;
 }
 L= M + I;
 line(40*N,height-X,40*(N+1),height-{L+J});
 X=L+J;
 M=L;
 I=J;
 N=N+1;
 }
