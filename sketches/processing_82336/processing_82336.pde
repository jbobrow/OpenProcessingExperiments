
int t = 0;
int I = 1; // Start with one infected at time 0
int N = 400; // total population number

float beta = 0.04;

float lambdan;
float x;

void setup() {  //setup function called initially, only once
  size(480,480);
  background(255);  //set background white
  stroke(0,0,0,30);
}

void draw() {  // this excecutes repeatedly
  t = 0;
  I = 1;
  while (t<480) { // repeat
    // birth rate now depends on n
    lambdan = (1-I/N)*I*beta;
    if (lambdan == 0) { // no more births
      line(t,height-N,width,height-N);
      break;
    }
    // draw random time x from Exp(lambda_n)
    x = -log(random(0,1))/lambdan;
    line(t,height-I,t+x,height-I);
    t = t+x;
    I = I+1;
  }
}
