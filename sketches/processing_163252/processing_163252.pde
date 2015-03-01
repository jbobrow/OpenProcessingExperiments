
PFont f;

float radius = 100;
float degrees = 0;
float xPos = 0;

void setup() {
  size(400, 400);
  background(255);
  noStroke();
  rectMode (CENTER);
  f = loadFont ("AvenirNext-Bold-120.vlw");
}

void draw() {
  
  fill (255,0,0);
  float yPos1 = (2*(height/8)) + sin(radians(degrees))* radius;
  ellipse (xPos, yPos1, 50, 50);
  
  fill (255,125,0);
  float yPos2 = (3*(height/8)) + sin(radians(degrees))* radius;
  ellipse (xPos, yPos2, 50, 50);
  
  fill(255,255,0);
  float yPos3 = (4*(height/8)) +sin(radians(degrees))* radius;
  ellipse (xPos, yPos3, 50, 50);
  
  fill(0,205,0);
  float yPos4 = (5*(height/8)) +sin(radians(degrees))* radius;
  ellipse (xPos, yPos4, 50, 50);
  
  fill(0,0,255);
  float yPos5 = (6*(height/8)) +sin(radians(degrees))* radius;
  ellipse (xPos, yPos5, 50, 50);
 
  
  fill(125,0,125);
  float yPos6 = (7*(height/8)) +sin(radians(degrees))* radius;
  ellipse (xPos, yPos6, 50, 50);
  
  degrees++;
  degrees = degrees % 360;
  xPos += 1;
  if (xPos > width) {
    xPos = 0;
    background (255);
  }
  
  fill(0);
  rect (10,200,20,400);
  
  textAlign (CENTER);
  textFont (f);
  fill(0);
  text ("Wave your", width/2, 175);
  text ("Pride Flag High", width/2, 225);
}



