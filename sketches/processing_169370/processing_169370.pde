
float t;  // time
float x;  // waiting time
float lambda; // individual birth rate
float mu; // individual death rate
int N=3;
int S;
int I;
int R;
float b;
float k;

 
void setup() {  //setup function called initially, only once
  size(480,480);    // set size of canvas
  background(255);  // set background white
  stroke(0,0,0,5);  // set stroke colour to black with high transparency
}
 
void draw() {  // this excecutes repeatedly
  t = 0;
  S = 400;
  I = 5;
  R = 0;
  while (t<800) { // repeat
    lambda = I*(b*S/N);
    mu = I*k;
    // draw random time x from Exp(lambda_n+mu_n)
    x = -log(random(0,1))/(lambda+mu);
    // plot function between t and t+x
    line(t,height-I,t+x,height-I);
    // update time
    t = t+x;
    // decide whether birth or death
    r = random(0,lambda+mu);
    if (r < lambda) {
      I=I+1; S=S-1;
    } else {
      I=I-1; R=R+1;
    }
  }
}
