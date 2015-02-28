
void setup () {
  size(800, 500);
}


float yPos;
float xPos;
float xSpeed = 4;
float ySpeed = 0.001;

void draw () {
  background(200, 200, 200);
  fill(255, 0, 0);
  ellipseMode(CENTER);
  if ((mousePressed) && (mouseY > (yPos - 50)) && (mouseY < (yPos + 50))) {
    ellipse(mouseX, mouseY, 30, 30);
    xPos = mouseX;
    yPos = mouseY;
    ySpeed = (mouseY - pmouseY)/1.5;
    xSpeed = (mouseX - pmouseX)/1.5;
  }
  else {
    ellipse(xPos + xSpeed, yPos + ySpeed, 30, 30);
    yPos = yPos + ySpeed;
    ySpeed = ySpeed + 0.5;
  }

  xPos = xPos + xSpeed;
  if (yPos > 485) {
    yPos = 484;
    ySpeed = -ySpeed + 3;
  }
  //ySpeed = ySpeed + 0.5;
  if (yPos < 5) {
    yPos = 6;
    ySpeed = -ySpeed - 3;
  }
  if (xPos > 790) {
    xPos = 789;
    xSpeed = -xSpeed + 3;
  }
  if (xPos < 5) {
    xPos = 6;
    xSpeed = -xSpeed - 3;
  }
  if (xSpeed > 0) {
    xSpeed = xSpeed/1.005;
    if (xSpeed < 0.0009) {
      xSpeed = 0;
    }
  }
  else if (xSpeed < 0) {
    xSpeed = xSpeed/1.005; 
    if (xSpeed > -0.0009) {
      xSpeed = 0;
    }
  }
}



