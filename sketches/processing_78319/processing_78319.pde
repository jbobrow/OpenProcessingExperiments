
int T = 0;
int N = 1;
float x;
float lambda = 0.02;

size(480,480);
background(255,255,255);

while (T<480) { // repeat
  // draw random time x from Exp(N*lambda)
  x = -log(random(0,1))/(N*lambda);
  line(T,height-N,T+x,height-N);
  T = T+x;
  N = N+1;
}
