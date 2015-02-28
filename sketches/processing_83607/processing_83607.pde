
float xPos = 0;
float xTarget = 600;
float yPos = 0;
float yTarget = 0;
float xVel = 0;
float yVel = 0;


void setup() {
  size(600, 600);
}

void draw() {

  fill(0, 20);
  rect(0, 0, width, height);

  fill(255);
  xVel*=0.9;
  yVel*=0.9;

  xTarget = mouseX;
  yTarget= mouseY;

  //x position
  //works out the difference between the final destination and current location
  float diffX = xTarget - xPos;
  diffX *=0.1;
  xVel += diffX;

  xPos += xVel;

  float diffY = yTarget - yPos;
  diffY *=0.1;
  yVel += diffY;
  
  yPos += yVel;

  ellipse(xPos, yPos, 50, 50);
}



