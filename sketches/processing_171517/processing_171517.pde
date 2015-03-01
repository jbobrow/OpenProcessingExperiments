
float t;  
float x;  
float lambda;
float mu; 
int N=501;
int S;
int I;
int R;
float b=0.05;
float k=0.01;
float Idet, IIdet, Sdet, SSdet, Rdet, RRdet;

 
void setup() {  
  size(800,800);    
  background(255); 
  
  stroke(0,0,0);
  strokeWeight(4);

  Idet=1;
  Sdet=500;
  Rdet=0;
 // for (int i=0; i<=800; i++) {
      
}


 
void draw() { 
  t = 0;
  S = 500;
  I = 1;
  R = 0;
  while (t<800) { 
    lambda = I*(b*S/N);
    mu = I*k;
    x = -log(random(0,1))/(lambda+mu);
    stroke(250,0,0,5); line(t,height-I,t+x,height-I);
    stroke(0,250,0,5); line(t,height-S,t+x,height-S);
    stroke(0,0,250,5); line(t,height-R,t+x,height-R);
    t = t+x;
    r = random(0,lambda+mu);
    if (r < lambda) {
      I=I+1; S=S-1;
    } else {
      I=I-1; R=R+1;
    }
  }
}
