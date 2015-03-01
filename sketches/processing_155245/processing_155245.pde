
color hintergrund = color (10, 7, 41);
color linienfarbe = color (99, 58, 81);
color linienfarbe2 = color (179, 170, 182);
color linienfarbe3 = color (68, 45, 69);

void setup() {
  size(640, 360);
}

void draw() {
  background(hintergrund);

  stroke (linienfarbe);
  strokeWeight (4);
  noFill ();
  pushMatrix();
  translate(mouseX, height*0.5);
  rotate(frameCount / 200.0);
  polygon(0, 0, 90, 6); 
  popMatrix();

  stroke (linienfarbe2);
  strokeWeight (1);
  pushMatrix();
  translate(width*0.6, height*0.5);
  rotate(frameCount / 50.0);
  polygon(0, 0, 90, 6); 
  popMatrix();

  stroke (linienfarbe3);
  strokeWeight (9);
  pushMatrix();
  translate(width*0.4, mouseY);
  rotate(frameCount / -200.0);
  polygon(0, 0, 90, 6); 
  popMatrix();
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
