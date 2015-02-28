
// This is a practice sketch for OpenProcessing.org
// by John Cannon
// 01 September 2011

void setup() {
//  size(400, 400);
  size(screen.width, screen.height);
  frameRate(10);
  smooth();
  
}
  
  void draw() {
  int d = int(random(30, 100));
  noStroke();
  fill (random(255), random(255), random(255),60);
  ellipse(random(width), random(height), d, d);
  }

