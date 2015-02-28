
int xPos = 25;
int yPos = 25;

void setup() {
  size(400, 200);
  background(15);
  noStroke();
  frameRate(50);
}

void draw() {
  if (keyPressed == true) {
    if (key == CODED) {
      if (keyCode == UP) {
        yPos -= 2;
      }
      if (keyCode == DOWN) {
        yPos += 2;
      }
      if (keyCode == LEFT) {
        xPos -= 2;
      }
      if (keyCode == RIGHT) {
        xPos += 2;
      }
    }
  }


  rectMode(CENTER);
  fill(255);
  rect(xPos, yPos, 50, 50);
  rectMode(CORNER);
  fill(0, 0, 0, 10);
  rect(0, 0, 400, 200);
}
