
//variables
float d;
float xPos;
float yPos; 
float xVel; 
float yVel;

void setup() {
  size(600, 600);
  background(255);
  smooth();
  frameRate(60);

  xPos=random(0+ d/2, width-d/2);
  yPos=random(0+ d/2, height-d/2);
  xVel=random(-10, 10);
  yVel=random(-5, 5);
  d=random(50, 100);
}

void draw() {
  background(255);
  stroke(random(50,255),random(50,255),random(50,255));
  strokeWeight(5);
  fill(0);
  ellipse(xPos, yPos, d, d);
  
  xPos=xPos+xVel;
  yPos=yPos+yVel;
  
  //conditionals for movement
  //left wall
  if (xPos<0+d/2) { 
    xVel=xVel*(-1);
  } 
  //top wall
  if (yPos<0+d/2) {
    yVel=yVel*(-1);
  } 
  //right wall
  if (xPos>width-d/2) {
    xVel=xVel*(-1);
  } 
  //bottom wall
  if (yPos>height-d/2) {
    yVel=yVel*(-1);
  } 
}


