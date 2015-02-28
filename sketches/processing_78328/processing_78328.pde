
int T = 0;
int N = 400;
int M = 400;
int K = 800;
float x;
float d = 0.02;
float b = 0.1;
float p1 = 0.1;
float p2 = 0.02;
  
size(480,480);
background(255,255,255);
  
while (T<480) { // repeat
  rmn = d*N;
  rnp = 2*b*M/K*(K-M-N);
  rnm = 2*p1*N*M/K;
  rpm = 2*p2*N*M/K;
  r = rmn+rnp+rnm+rpm;
  // draw random time x from Exp(r)
  x = -log(random(0,1))/r;
  stroke(255,0,0);
  line(T,height-N,T+x,height-N);
  stroke(0,0,255);
  line(T,height-M,T+x,height-M);
  T = T+x;
  // decide which process
  x = random(0,r);
  if (x < rmn) {
    N = N-1;
  } else if (x < rmn+rnp) {
    M = M+1;
  } else if (x < rmn+rnp+rnm) {
    M = M-1;
  } else {
    N = N+1;
    M = M-1;
  }
}
