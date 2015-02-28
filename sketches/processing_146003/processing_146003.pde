
void setup() {
  size(500, 500);
  background(0, 0, 45);
}

void draw() {
  background(0, 0, 45);
  if (mousePressed) {
    background(200, 0, 0);
  }
  noStroke();
  fill(255);
  translate(250, 250);
  rotate(frameCount / -100.0);
  polygon(0, 0, 70, 5); 
  noFill();
  stroke(220, 125, 0);
  if (mousePressed) {
    stroke(0);
  }
  strokeWeight(5);
  polygon(0, 0, 80, 5);
}  

void polygon(float x, float y, float radius, int npoints) {
  float angle = frameCount/200 / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}  
  
