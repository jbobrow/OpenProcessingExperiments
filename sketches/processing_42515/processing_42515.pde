
void setup() {
  size(400, 400);
  smooth();

}

void draw() {
  noStroke();
  fill(231, 232, 197);
  rect(0, 0, width, height);

  stroke(127, 206, 142);
  strokeWeight(10);
  drawCross(0, 0, 60);
  drawCross(340, 0, 60);
  drawCross(340, 340, 60);
  drawCross(0, 340, 60);

  stroke(mouseX/2, mouseY/2, 100);
  noCursor();
  drawCross(pmouseX, pmouseY, 80);
}


void drawCross(float x, float y, float crossSize) {

  line (x, y, x+crossSize, y+crossSize);
  line (x+crossSize, y, x, y+crossSize);
  line (x+crossSize/2, y, x+crossSize/2, y+crossSize);
  line (x, y+crossSize/2, x+crossSize, y+crossSize/2);
}				
