
float angInc = 0.2;
float d, e, f, theta;
float dfScale = 1.9;
float springBack = 0.96;
float m = 0;
float mScale = 0;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {

  background(#455C7B);
  translate(width*.5, height*.5);
  fill(#FFAA5C, 30);
  noStroke();
  stroke(#FFAA5C,100);
  m+=mScale;

  float radius = 100;
  float dx = sin(theta)*radius;
  float dy = cos(theta)*radius;

  d = map(dx, -radius, radius, -dfScale, dfScale)/3;
  e = map(dx, -radius, radius, -angInc, angInc)/3;
  f = map(dy, -radius, radius, -dfScale, dfScale)/3;

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

