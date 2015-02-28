
int T = 0;
int N = 1;
float x;
float lambda = 0.02;
float e;
float e1;

void setup() {  //setup function called initially, only once
  size(480,480);
  background(255);  //set background white
  
  // plot expected value
  stroke(255, 0, 0);
  strokeWeight(4);
  for (int i = 0; i < width; i = i+1) {
    line(i, height-exp(lambda*i), i+1, height-exp(lambda*(i+1)));
  }
  
  // plot expected value +- standard deviation
  stroke(0, 255, 0);
  strokeWeight(2);
  for (int i = 0; i < width; i = i+1) {
    e = exp(lambda*i);
    e1 = exp(lambda*(i+1));
    line(i, height-(e+sqrt(e*(e-1))), i+1, height-(e+sqrt(e1*(e1-1))));
    line(i, height-(e-sqrt(e*(e-1))), i+1, height-(e-sqrt(e1*(e1-1))));
  }
  
  stroke(0,0,0,30);
  strokeWeight(1);
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
