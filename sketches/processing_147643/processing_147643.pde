
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: JooYongGill
// ID: 201420108

float t = 40;
void setup()
{
  size(1024, 768);
  background(255);
  smooth();
  noLoop();
}

void draw() {
  for (int a = 30; a<1024; a = a + 60) {
    for (int b = 30; b<1024; b = b + 60) {
      fill(7, 229, 146);
      rectMode(CENTER);
      noStroke();
      rect(b, a, t, t);
      line(a, 768, a, 768);
    }
  }
  for (int c = 60; c<1000; c = c + 60) {
    for (int d = 60; d<1000; d = d + 60) { 
      fill(0, 196, 191);
      noStroke();
      ellipse(c, d, 13, 23);
      ellipse(c, d, 23, 13);
    }
  }
  for (int e = 30; e<1000; e = e + 30) {
    for (int f = 30; f<1000; f = f + 30) { 
      fill(255);
      noStroke();
      ellipse(e, f, 5, 10);
      ellipse(e, f, 10, 5);
    }
  }
}
void keyPressed() {
  background(0);
  redraw();
} 
