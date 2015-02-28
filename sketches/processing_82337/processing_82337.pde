
int T = 480;

float N = 1000;
float alpha = 0.2; // infectivity 
float rho = 0.15; // individual recovery rate

float lambdan; // lambda_n
float mun;     // mu_n
float x;

 
void setup() {  //setup function called initially, only once
  size(T,480);
  background(255);  //set background white
  
  // plot deterministic component
  stroke(255,0,0);
  strokeWeight(4);
  float I = 1;
  for (int t=0; t<T; t=t+1) {
    line(t, height-I, t+1, height-N*phi(t));
    I = N*phi(t);
  }
  
  // set stroke to transparent black for the sample paths
  strokeWeight(1);
  stroke(0,0,0,5);
}
 
void draw() {  // this excecutes repeatedly
  float t = 0;
  int I = 1;
  while (t<T) { // repeat
    lambdan = (1-I/N)*I*alpha; // constant immigration
    mun = I*rho;   // simple death
    // draw random time x from Exp(lambda_n+mu_n)
    x = -log(random(0,1))/(lambdan+mun);
    line(t, height-I, t+x, height-I);
    t = t + x;
    // decide whether birth or death
    float r = random(0, lambdan+mun);
    if (r < lambdan) {
      I = I+1;
    } else {
      I = I-1;
    }
  }
}

float phi(int t) {
  float d = alpha-rho;
  float e = exp(d*t);
  return e*d/((e-1)*alpha+N*d);
}
  
