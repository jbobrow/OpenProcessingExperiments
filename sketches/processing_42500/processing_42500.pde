
void setup() {
  size(500, 500);
}


void draw() {
  background(0);
  noStroke();
  smooth();
  fill(22, 70, 95,50);
  rect(60, 60, 380, 380); 
  rect(40, 40, 420, 420); 
  rect(20, 20, 460, 460); 
  fill(255,70);
  ellipse(mouseX, mouseY, 20, 20);
  fill(157, 221, 255);
  ellipse(0, 0, 100, 100);
  ellipse(0, 500, 100, 100);
  ellipse(500, 0, 100, 100);
  ellipse(500, 500, 100, 100);
}

void drawCross(float x, float y, float crossSize) {
  stroke(255, 40, 180);
  strokeWeight(4);
  line(x, y, x + crossSize, y + crossSize);
  line(x + crossSize, y, x, y + crossSize);
}


