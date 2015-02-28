
int t = 0;
int I = 200;

int N=1000;
float beta = 1;
float gamma = 0.92;

float lambdan; // lambda_n
float mun;     // mu_n 
float x;
 
size(1000,280);
background(255,255,255);
 
while (t<1000) { // repeat
  lambdan = (1-I/N)*I*beta; 
  mun = I*gamma; 
  // draw random time x from Exp(lambda_n+mu_n)
  x = -log(random(0,1))/(lambdan+mun);
  line(t,height-I,t+x,height-I);
  t = t+x;
  // decide whether birth or death
  r = random(0,lambdan+mun);
  if (r < lambdan) {
    I = I+1;
  } else {
    I = I-1;
  }
}
