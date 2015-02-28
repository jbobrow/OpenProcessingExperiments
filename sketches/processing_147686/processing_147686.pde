
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: CHAE Seo Rin
// ID: 201420110

void setup() {
  size (1024, 768);
  background(255);
  smooth();
  noLoop();
}

void draw() {
  for (int a = 20; a< width; a = a+40) {
    for (int b = 20; b< width; b = b+40) {
      stroke(#31BFFF);
      strokeWeight(2);
      noFill();
      ellipse(a-0.2, b-0.2, 50, 50);
      noStroke();
      fill(#FFADEC);
      ellipse(a-0.2, b-0.2, 10, 10);
    }
  }
}

void keyPressed() {
  background(255);
  redraw();
}

