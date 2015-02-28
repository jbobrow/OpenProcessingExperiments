
int T = 0;
int N = 1;
float x;
float lambda = 0.02;

void setup() {  //setup function called initially, only once
  size(480,480);
  background(255);  //set background white
  stroke(0,0,0,30);
}

void draw() {  // this excecutes repeatedly
  T = 0;
  N = 1;
  while (T<480) { // repeat
    // draw random time x from Exp(lambda)
    x = -log(random(0,1))/(N*lambda);
    line(T,height-N,T+x,height-N);
    T = T+x;
    N = N+1;
  }
}
