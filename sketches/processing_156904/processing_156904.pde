
float angInc = 0.2;
float d,e,f;
float dfScale = 1.9;
float springBack = 0.96;
float m = 0;
float mScale = 0.005;

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  
  background(0);
  translate(width/2, height/2);
  fill(255, 30);
  noStroke();
m+=mScale;
  if (mousePressed) {
  d = map(mouseX, 0, width, -dfScale, dfScale);
  e = map(mouseX, 0, width, -angInc, angInc);
  f = map(mouseY, 0, width, -dfScale, dfScale);
   
  } else {
    d *= springBack;
    e *= springBack;
    f *= springBack;
  }
  
  for (int i = 0; i < 20; i++) {
    float angle = i*e;
    float x = d*i;
    float y = f*i;
    translate(x, y);
    pushMatrix();
    rotate(angle + m);
    rectMode(CENTER);
    rect(0, 0, 200, 200);
    popMatrix();
  }
  
}

