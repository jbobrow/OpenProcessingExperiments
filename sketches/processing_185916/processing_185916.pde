
float angleInc = 1.0 / 128.0;
float offset = 0.0;
float offsetInc = 0.01;
float r;

void setup() {
  size(500, 500);
  r = width / 1.5;
  fill(32);
  noStroke();
}

void draw() {
  background(255);
  float angle = 0;
  
  translate(width / 2.0, height / 2.0);
  beginShape();    
  while (angle < TWO_PI) {    
    float xn = sin(angle * 3);
    float yn = cos(angle * 7);
    float n = noise(xn + offset, yn + offset);
    PVector p = new PVector(sin(angle), cos(angle));
    p.mult(r * n);
    vertex(p.x, p.y);    
    angle += angleInc;
  }
  endShape();  
  offset += offsetInc;
}
