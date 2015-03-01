
float t;  // time
int n;  // population number
float x;  // waiting time
float lambda = 0.01; // individual birth rate
float mu = 0.015; // individual death rate
float nu = 2; // immigration rate
float lambdan; // lambda_n
float mun;     // mu_n

 
void setup() {  //setup function called initially, only once
  size(480,480);    // set size of canvas
  background(255);  // set background white
  stroke(0,0,0,5);  // set stroke colour to black with high transparency
}
 
void draw() {  // this excecutes repeatedly
  t = 0;
  n = 1;
  while (t<800) { // repeat
    lambdan = n*lambda + nu; // simple birth and constant immigration
    mun = n*mu;   // simple death
    // draw random time x from Exp(lambda_n+mu_n)
    x = -log(random(0,1))/(lambdan+mun);
    // plot function between t and t+x
    line(t,height-n,t+x,height-n);
    // update time
    t = t+x;
    // decide whether birth or death
    r = random(0,lambdan+mun);
    if (r < lambdan) {
      n = n+1; // birth
    } else {
      n = n-1; // death
    }
  }
}
