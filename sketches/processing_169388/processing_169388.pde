
float t;  // time
float x;  // waiting time
float lambda; // individual birth rate
float mu; // individual death rate
int N=501;
int S;
int I;
int R;
float b=0.05;
float k=0.01;

 
void setup() {  //setup function called initially, only once
  size(800,800);    // set size of canvas
  background(255);  // set background white

}
 
void draw() {  // this excecutes repeatedly
  t = 0;
  S = 500;
  I = 1;
  R = 0;
  while (t<800) { // repeat
    lambda = I*(b*S/N);
    mu = I*k;
    // draw random time x from Exp(lambda_n+mu_n)
    x = -log(random(0,1))/(lambda+mu);
    // plot function between t and t+x
    stroke(250,0,0,5); line(t,height-I,t+x,height-I);
    stroke(0,250,0,5); line(t,height-S,t+x,height-S);
    stroke(0,0,250,5); line(t,height-R,t+x,height-R);
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
