
float x = 100;
float y = 100;
float ellipseWidth = 60;
boolean xDirection = true;  //True means right, false means left
boolean yDirection = true;  //True means down, false means up
float speed = 3.3;

void setup() {
  size(500, 300);
  //size (screen.width, screen.height);
  //fullscreen
  smooth();
}

void draw() {
  
  ellipseWidth = mouseX;
  
  background(255);

  //Update the X coordinate
  if(xDirection) {
    x = x + speed;
  } else {
    x = x - speed;
  }

  //Check for edge of screen
  if(x > width - ellipseWidth / 2) {
    xDirection = false;
  } else if (x < 0 + (ellipseWidth / 2)) {
    xDirection = true;
  }

  //Update the Y coordinate
  if(yDirection) {
    y = y + speed;
  } else {
    y = y - speed;
  }
  
  //Check for edge of screen
  if(y > height - (ellipseWidth / 2)) {
    yDirection = false;
  } else if (y < 0 + (ellipseWidth / 2)) {
    yDirection = true;
  }
    
  


  //Draw the ball
  fill(0, 0, 150);
  ellipseMode(CENTER);
  ellipse(x, y, ellipseWidth, ellipseWidth);
}


