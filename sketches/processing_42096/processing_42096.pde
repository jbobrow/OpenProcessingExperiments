
int xPosition = 10;
int xSpeed = 5;
int ySpeed = 2;
int yPosition = 10;

void setup () {
  size(400, 400);
}

void draw() {
  background(0);
  fill(175);
  xPosition =xPosition+xSpeed;
  yPosition = yPosition+ySpeed;
  ellipse(xPosition, yPosition, 20, 20);  
  fill(255);
  rect(390, mouseY, 10, 60);

  if (xPosition>400) { 
    background(255,0,0);
    noLoop();
  }

  if (xPosition>=390 && yPosition>=mouseY && yPosition<=mouseY+60) { 
    xSpeed=-5;
  }

  if (xPosition<=0) { //ball gets to edge of screen
    xSpeed=5;
  }

  if (yPosition>=400) { 
    ySpeed=-2;
  }

  if (yPosition<=0) { //ball gets to edge of screen
    ySpeed=2;
  }
}
                
