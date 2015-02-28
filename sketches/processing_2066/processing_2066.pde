
float x,y;
float sol=50;
float v0=100;
float v=200;
float R=20;
int e;
float T0,T1=0,DT;

void setup() {
  colorMode(HSB);
  smooth();
  size(400,400);
  x=width/2;
  y=height-sol-R/2;
  T0=0;
}

void draw() {
  float x0=0;
  float y0=0;
  float A=0;
  if(T0==0) T0=millis();
  DT=(millis()-T0)/1000;
  T0=millis();
  noStroke();
  fill(0,255);
  rect(0,0,width,height);

  v=v-v0*DT;
  y=-v*DT+y;
  if(y>height-sol-R/2) {
    v=-v;
    e=3;
  }
  if(e==3) {
    T1=T1+DT;
    float B=10*exp(-T1/100);
    float A0=0.1*exp(-T1/100);
    if (T1<1) {
      x0=random(-B,B);
      y0=random(-B,B);
      A=random(-A0,A0);
    }
    if(T1>1){
      e=0;
      T1=0;
      
    }
  }
  fill(color(100,255,255));
  pushMatrix();
  
  translate(width/2+x0,y0+height-sol/2);
  rotate(A);
  //translate(x0,y0);
    rect(-width/2,-sol/2,width,sol);

  popMatrix();
  fill(color(200,255,255));
  pushMatrix();
    translate(x+x0,y+y0);
  rotate(A);

  rect(-R/2,-R/2,R,R);
  popMatrix();
}

