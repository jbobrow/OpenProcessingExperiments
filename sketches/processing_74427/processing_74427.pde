
int d = 20;
int xPos = 10;
int yPos = 10;
int directionX = 2;
int directionY = 2;
color fillVal = color(126);

void setup() {
  background(174, 110, 232);
  size(400, 300, P2D);
  smooth();
}

void draw() {
  fill(144, 10, 28);
  ellipse(xPos, yPos, d, d);
  xPos = xPos + directionX;
  yPos = yPos + directionY;
  fill(149, 191, 13);
  rect(xPos, yPos, d, d);
  xPos = xPos + directionX;
  yPos = yPos + directionY;
  fill(fillVal);
  
  if (yPos > mouseY - d) {
    directionY = 2;
  }
 
 //right border
  if (xPos > mouseX - d/2) {
    directionX = -2;
  }
  // left border
  if (xPos < d/2) {
    directionX = 2;
  }

  // top boerder
  if (yPos < d/2) {
    directionY = 2;
  }

  // bottom boerder
  if (yPos > mouseY - d/2) {
    directionY = -2;
  }
}
