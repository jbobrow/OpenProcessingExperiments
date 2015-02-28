
void setup() {
  size(600, 600);
}


void draw() {
  background(40);

  float progress = map(mouseX, 0, width, 0, 1);

  noFill();
  stroke(255);

  curve(8, 14,    454, 146,    50, 406,    448, 458);   // x1, y1, x2, y2, x3, y3, x4, y4
  text("Start", 454 + 10, 146);
  text("End", 50 + 10, 406);
  
  
  float px = curvePoint(8, 454, 50, 448, progress);     // x1, x2, x3, x4, progress
  float py = curvePoint(14, 146, 406, 458, progress);   // y1, y2, y3, y4, progress

  ellipse(px, py, 10, 10);
}



