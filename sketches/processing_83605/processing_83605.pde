

float xPosition = 25;
float xSpeed = 4;
float yPosition = 25;
float ySpeed = 2;
float radius = 25;
float rectY;

void setup() {

  size(600, 400);

  rectY = height -50;
}

void draw() {

  background(200, 200, 200);
  fill(100, 100, 255);
  noStroke();
  //draw a circle 


    //x position
  //move x position right
  xPosition = xPosition + xSpeed;

  if (xPosition + radius>width) {
    xSpeed = - xSpeed;
  }
  else if (xPosition -radius< 0) { //bounce back left
    xSpeed = - xSpeed;
  }

  //y position
  //move y position down
  yPosition = yPosition + ySpeed;

  if (yPosition -radius< 0) { //bounce back up
    ySpeed = - ySpeed;
  }

  //calls ball
  ellipse(xPosition, yPosition, radius*2, radius*2);
  

  //makes ball bounce off bat
  if (xPosition >= mouseX-50 && xPosition <= mouseX+50 && yPosition >= rectY-5-radius && yPosition <= rectY+5-radius) {
    yPosition = rectY-5-radius;
    ySpeed = - ySpeed;
  }

  //Bat attatched to mouse
  fill(0);
  rectMode(CENTER);
  rect(mouseX, rectY, 100, 10);
}



