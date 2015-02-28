
int T = 0;
int N = 1;
float x;
float lambda = 1; // individual birth rate
float mu = 1; // individual death rate
float lambdan; // lambda_n
float mun;     // mu_n 
 
size(480,480);
background(255,255,255);
 
while (T<480) { // repeat
  lambdan = (N+1)*lambda;
  mun = N*mu;
  // draw random time x from Exp(lambda_n+mu_n)
  x = -log(random(0,1))/(lambdan+mun);
  line(T,height-N,T+x,height-N);
  T = T+x;
  // decide whether birth or death
  r = random(0,lambdan+mun);
  if (r < lambdan) {
    N = N+1;
  } else {
    N = N-1;
  }
}
