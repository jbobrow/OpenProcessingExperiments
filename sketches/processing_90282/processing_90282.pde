
int xPos = 25;
int xSpeed = 10;
int yPos = 25;
int ySpeed = 5;
int radius = 20;
int rectY;

void setup() {

  size(800, 650);

  rectY = height -50;
}

void draw() {

  background(50, 80, 50);
  fill(255, 255, 255);
  noStroke();

  xPos = xPos + xSpeed;

  if (xPos + radius>width) {
    xSpeed = - xSpeed;
  }
  else if (xPos -radius< 0) {
    xSpeed = - xSpeed;
  }

  yPos = yPos + ySpeed;
  if (yPos + radius>height) {
    ySpeed = -ySpeed;
  }
  else if (yPos -radius< 0) {
    ySpeed = -ySpeed;
  }

  smooth();
  ellipse(xPos, yPos, radius*2, radius*2);

  if (xPos >= mouseX-50 && xPos <= mouseX+50 && yPos >= rectY-5-radius && yPos <= rectY+5-radius) {
    yPos = rectY-5-radius;
    ySpeed = - ySpeed;
  }

  fill(255);
  smooth();
  rectMode(CENTER);
  rect(mouseX, rectY, 100, 40);
}


