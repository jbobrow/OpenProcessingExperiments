
int T = 0;
int N = 0;
float x;
float lambda = 1;
int zoom = 40;

size(480,480);
background(255,255,255);
line(10, 0, 10, height);
line(0, height-10, width, height-10);
for (int i = 1; i < 12; i = i+1) {
  line(6, height-10-zoom*i, 14, height-10-zoom*i);
  line(10+zoom*i, height-6, 10+zoom*i, height-14);
}
strokeWeight(4);
stroke(255, 0, 0);
line(10, height-10, width, 0);
stroke(0, 0, 255);

while (T<600) { // repeat
  // draw random time x from Exp(lambda)
  x = -log(random(0,1))/lambda;
  line(10+zoom*T, height-10-zoom*N,10+zoom*(T+x),height-10-zoom*N);
  T = T+x;
  N = N+1;
}
