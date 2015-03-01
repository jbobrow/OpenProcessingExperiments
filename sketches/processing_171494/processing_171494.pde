
float t; 
float x; 
float lambda;
float mu1;
float mu2;
float nu;
int N=502;
int S;
int E;
int I;
int R;
float a=0.02;
float b=0.02;
float c=0.1;
 
  
void setup() { 
  size(800,800);   
  background(255);
 
}
  
void draw() {
  t = 0;
  S = 500;
  E = 1;
  I = 1;
  R = 0;
  while (t<800) {
    lambda = E*(b*S*I/E*N);
    mu1 = E*a;
    mu2 = I*(a*E/I);
    nu = I*c;
    x = -log(random(0,1))/(lambda+mu1)-log(random(0,1))/(mu2+nu);
    stroke(250,0,0,5); line(t,height-I,t+x,height-I);
    stroke(0,250,0,5); line(t,height-S,t+x,height-S);
    stroke(0,0,250,5); line(t,height-R,t+x,height-R);
    stroke(0,0,0,5); line(t,height-E,t+x,height-E);
    t = t+x;
    r = random(0,lambda+0.5*(mu1+mu2)+nu);
    if (r < lambda) {
      E=E+1; S=S-1;
    } else if (lambda < r < 0.5*(mu1+mu2)){
      E=E-1; I=I+1;
    } else {
      I=I-1; R=R+1;
    }
  }
}
