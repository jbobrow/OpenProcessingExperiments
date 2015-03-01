
float angInc = 0.2;
float d, e, f, theta;
float dfScale = 1.9;
float springBack = 0.96;
float m = 0;
float mScale = 0.005;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {

  background(#351330);
  translate(width*.7, height*.7);
  fill(#E7CAA4, 30);
  noStroke();
  mScale=0;
  m+=mScale;

  float dx = map(sin(theta),-1,1,width/2,100);
  float dy = map(sin(theta),-1,1,height/2,100);

  d = map(dx, 0, width, -dfScale, dfScale);
  e = map(dx, 0, width, -angInc, angInc);
  f = map(dy, 0, width, -dfScale, dfScale);

  for (int i = 0; i<20; i++) {
    float angle = i*e;
    float x = d*i;
    float y = f*i;
    translate(x, y);
    pushMatrix();
    rotate(angle + m);
    rectMode(CENTER);
    rect(0, 0, 150, 150);
    popMatrix();
  }
  
  theta += 0.0523;
  
  
}

