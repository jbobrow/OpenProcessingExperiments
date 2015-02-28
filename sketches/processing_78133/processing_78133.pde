
int T = 0;
int N = 0;
float x;
float lambda = 1;

size(480,480);
background(255,255,255);
stroke(255, 0, 0);
line(0, height, width, 0);
stroke(0, 0, 0);

while (T<600) { // repeat
  // draw random time x from Exp(lambda)
  x = -log(random(0,1))/lambda;
  line(T,height-N,T+x,height-N);
  T = T+x;
  N = N+1;
}
