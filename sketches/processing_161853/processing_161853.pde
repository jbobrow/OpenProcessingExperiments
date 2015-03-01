
float xPos ;
float yPos ;
float xSpeed ;
float ySpeed ;
float gravity = 1;
float ballSize = 30;

void setup() {
  size(500, 500);
  noStroke();
  xPos = width/2;
  yPos = height/2;
  frameRate(24);

  xPos = 200;
  yPos = 200;
}

void draw() {
  background(255);
  smooth();
  ellipse(xPos, yPos, ballSize, ballSize);
  fill(255, 0, 0);

  if (yPos > height - ballSize/2) {
    yPos = height - ballSize/2;
    ySpeed = ySpeed*- 0.35 ;
    gravity = 0.5;
  }

  yPos += ySpeed;

  ySpeed += gravity;

  if (mousePressed) {
    if ((mouseX > (xPos - 20) && mouseX < (xPos + 20)) &&
        (mouseY > (yPos - 20) && mouseY < (yPos + 20))) {
      xSpeed = mouseX - pmouseX;
      ySpeed = mouseY - pmouseY;
    }
  }
    xPos = xPos + xSpeed;
    yPos = yPos + ySpeed;
     if (xPos > width - 20 || xPos <= 20) {
    xSpeed = -xSpeed;
  }
  if (yPos > height - 20 || yPos <= 20) {
     ySpeed += gravity;
  }
    xSpeed *=  1;
    ySpeed *=  1;
}


