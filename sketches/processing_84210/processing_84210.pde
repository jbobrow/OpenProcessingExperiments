
float T = 0;
int N = 1;
float x;
float lambda = 0.05;
float mu = 0.02; 
float nu = 0.01; 
float Omega = 480;
float lambdan; // lambda_n
float mun;     // mu_n

 
void setup() {  //setup function called initially, only once
  size(480,480);
  background(255);  //set background white
  stroke(0,0,0,5);
}
 
void draw() {  // this excecutes repeatedly
  T = 0;
  N = 1;
  while (T<480) { // repeat
    if (N==0) {
      lambdan = 1;
    } else if (N>Omega) {
      lambdan = 0;
    } else {
      lambdan = lambda*N*(1-N/Omega);
    }
    mun = N*mu+nu;
    // draw random time x from Exp(lambda_n+mu_n)
    x = -log(random(0,1))/(lambdan+mun);
    line(T,height-N,T+x,height-N);
    T = T+x;
    // decide whether birth or death
    float r = random(0,lambdan+mun);
    if (r < lambdan) {
      N = N+1;
    } else {
      N = N-1;
    }
  }

}
