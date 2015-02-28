
int xPos=30;
int yPos=70;
int xVelocity=7;
int yVelocity=7;

void setup() {
  size(600, 200);
  noStroke();
  smooth();
}
void draw() {
  background(20, 20, 20, 50);
  fill(255, 255, 70, 100);
  ellipse(xPos, yPos, 25, 25);
  xPos = xVelocity + xPos;
  yPos = yVelocity + yPos;
  if ((xPos > 600) || (xPos < 15)) {
    xVelocity = xVelocity * -1;
}
  if ((yPos > 200) || (yPos < 5)) {
    yVelocity = yVelocity * -1;
  }
}




