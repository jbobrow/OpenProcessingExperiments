
// David Mrugala

void setup() {
  size(600, 600);
  colorMode(RGB);
  noLoop();
}

void draw() {
  background(255);

  strokeCap(CORNER);
  strokeWeight(1);

  translate(width/2, height/2);
  for (int i=0; i<360; i++) {
    pushMatrix();
    rotate(radians(i));
    stroke(random(255), random(255), random(255));
    line(0, 0, 0, 250);
    line(0, 255, 0, random(255,280));
    popMatrix();
  }
}
void mousePressed() {
  redraw();
}

