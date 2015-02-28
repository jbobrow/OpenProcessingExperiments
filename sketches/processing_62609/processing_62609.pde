
void setup() {
  size(900, 500);
  smooth();
  noStroke();
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  fill(0, 0, 0);
  drawStar();
  popMatrix();
  
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(TWO_PI * frameCount/800);
  fill(0, 0, 0);
  drawStar();
  popMatrix();
}

void drawStar() {
  int numSpokes = 100;
  for (int i=0; i<numSpokes; i++) {
     float t0 = map(i, 0, numSpokes-1, 0, TWO_PI);
     float t1 = t0 + (TWO_PI/(2*numSpokes));
     arc(0, 0, 1000, 1000, t0, t1);
  }
}
