
float angInc = .1;
float d, e, f, theta;
float dfScale = 1.9;
float springBack = 0.96;
float m = 0;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {

  background(#455C7B);
  for(int n=0;n<3;n++){  
  for(int p=0;p<3;p++){
  pushMatrix();
  translate((n+.5)*width/3, (p+.5)*height/3);
  fill(#FFAA5C, 30);
  noStroke();
  stroke(#FFAA5C,100);
  rotate((angle + m)*(1-2*int((3*p+n)%2==1)));
  float radius = 100;
  float dx = sin(theta)*radius;
  float dy = cos(theta)*radius;
  d = map(dx, -radius, radius, -dfScale, dfScale)/3;
  e = map(dx, -radius, radius, -angInc, angInc)/3;
  f = map(dy, -radius, radius, -dfScale, dfScale)/3;
  if(n==0 && p==0)rotate(20*e);

  for (int i = 0; i<20; i++) {
    float angle =i*e;
    float x = d*i;
    float y = f*i;
    translate(x, y);
    pushMatrix();
    rotate(angle + m);
    scale(1/log(i));
    rectMode(CENTER);
    rect(0, 0, 150, 150);
    popMatrix();
  }  
  popMatrix();
  }
  
}

theta += 0.0523;
}
