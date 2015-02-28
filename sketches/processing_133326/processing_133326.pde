
void setup() {
  size(400,400);
}

void draw() {
  background(100);
  drawHouse(mouseX,mouseY);
  drawHouse(width-mouseX,mouseY);
}

void drawHouse(int theX, int theY) {
  rectMode(CENTER);
  fill(255);
  rect(theX,theY,100,100);
  fill(0);
  rect(theX,theY-50,100,20);
}
