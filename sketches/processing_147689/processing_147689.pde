
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: MinKyung Kim
// ID: 201420065

void setup() {
  size (1024, 768);
  smooth();
  noLoop();
  background(0);
}

void draw() {
  for (int a=30; a<width; a=a+50) {
    for (int b=0; b<width; b=b+50) {
      rectMode(CENTER);
      fill(#9EEFFC);
      rect(a, b, 30, 15);
      ellipseMode(CENTER);
      noFill();
      stroke(#15626F);
      strokeWeight(2);
      ellipse(a-0.3, b-0.3, 35, 40);
    }
  }
}

void keyPressed() {
  background(0);
  redraw();
} 

