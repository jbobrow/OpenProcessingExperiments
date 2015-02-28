
int t;
int n;
float x;
float lambda = 1;

void setup() {  //setup function called initially, only once
  size(480,480);    // set size of canvas
  background(255);  // set background white
  stroke(0,0,0,5);  // set stroke colour to black with high transparency
}

void draw() {  // this excecutes repeatedly
  t = 0;
  n = 0;
  while (t<480) { // repeat
    // draw random time x from Exp(lambda)
    x = -log(random(0,1))/lambda;
    // plot the step function between t and t+x
    line(t,height-n,t+x,height-n);
    // update t and n
    t = t+x;
    n = n+1;
  }
}
