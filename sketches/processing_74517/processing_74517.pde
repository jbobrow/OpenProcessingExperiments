
int d = 40;
int xPos = 20;
int yPos = 20;

int directionX = 5;
int directionY = 5;


void setup() {
  size(400, 400);
  noCursor();
}

void draw() {
  background(200);
  rect(0, 350, 400, 50);
  line(350, 0, 350, 100);
  line(350, 250, 350, 350);


  ellipse(xPos, yPos, d, d);
  xPos = xPos + directionX;
  yPos = yPos + directionY;

  // bottom or top border
  if (yPos > 350 - d/2 || yPos < 0 + d/2) {
    directionY = -directionY;
  }

  // left border
  if (xPos < 0 + d/2) {
    directionX = directionX * -1 + 1;
  }

  // LINE border
  if (xPos > 330 && yPos > mouseY && yPos < yPos + 50) {
    directionX = -directionX;
  }
  rect (330, mouseY, 5, 50);

  // hole
  if (xPos > 350 - d/2 && yPos > 50 && yPos < 250) {
    directionX = 1;
  }
  else if (xPos > 350) {
    directionX = -directionX;
  }

  // bat
  if (xPos > 330 - d/2 && yPos > mouseY && yPos < mouseY + 50) {
    directionX= -directionX;
  }
}
