
float xPos;
float yPos;
float speedX;
float speedY;

void setup() {
  size(700, 700);
  xPos = 1;
  yPos = 3;
  speedX = 5;
  speedY = 10;
}

void draw () {
  strokeWeight(mouseY);
  stroke(xPos/2, yPos/2, 255);
  background(xPos/3, yPos/3, 255);
  xPos += speedX;//movement
  if (xPos > width) {
    speedX *= -1;
  }

  if (xPos < 0) {
    speedX *= -1;
  }

  yPos += speedY;
  if (yPos > height) {
    speedY *= -1;
  }

  if (yPos < 0) {
    speedY *= -1;
  }

  ellipse(xPos, yPos, mouseX, 20);
}



