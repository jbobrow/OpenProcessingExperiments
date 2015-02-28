
int d = 10;

int xPos = 100;
int yPos = 100;
int directionX = 1;
int directionY = 1;

void setup() {
  size(400, 400, P2D);

  smooth(4);
}

void draw() {
  background(255);

  noStroke();
  fill(148, 128, 0);
  ellipseMode(CORNER);
  ellipse(xPos, yPos, 40, 40);
  fill(255);

  xPos = xPos + directionX;
  yPos = yPos + directionY;

  if (xPos > mouseX || xPos < d) {
    directionX = -directionX;
  }


  if (yPos < d || yPos > mouseY) {
    directionY = -directionY;
  }

  if (mousePressed) {
    fill(128, 128);
    rect(mouseX, mouseY, 45, 45);

  }
}
