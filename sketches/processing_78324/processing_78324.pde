
int T = 0;
int N = 1;
float x;
float lambda = 0.0001;
int K = 400;
float lambdan;

void setup() {  //setup function called initially, only once
  size(480,480);
  background(255);  //set background white
  stroke(0,0,0,30);
}

void draw() {  // this excecutes repeatedly
  T = 0;
  N = 1;
  while (T<480) { // repeat
    // birth rate now depends on n
    lambdan = N*(K-N)*lambda;
    if (lambdan == 0) { // no more births
      line(T,height-N,width,height-N);
      break;
    }
    // draw random time x from Exp(lambda_n)
    x = -log(random(0,1))/lambdan;
    line(T,height-N,T+x,height-N);
    T = T+x;
    N = N+1;
  }
}
