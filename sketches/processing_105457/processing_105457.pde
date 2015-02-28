
void setup() {
  size(500, 500);
  background(255);
  smooth();

  noLoop();
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  hexagon(400, 20, 90, 0, 20);
  popMatrix();
}

void hexagon(float R, float r, int t, float c, int count) {
  beginShape();
  for (int i = 0;i < 6;i++) {
    fill(0, c, 255, 150);
    stroke(0, c, 255, 200);
    vertex(R*cos(radians(t + 360*i/6)), R*sin(radians(t + 360*i/6)));
  }
  endShape(CLOSE);

  if (R > 0) {
    hexagon(R-=20, 20, (count%2)*90, random(255), --count);
  }
}

void mousePressed() {
  redraw();
}



