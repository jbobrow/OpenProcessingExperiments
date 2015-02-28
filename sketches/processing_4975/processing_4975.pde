
/**
  A simple ball animation made by Cym - http://cymspace.net/
  This is my homework for the processing class ;-)
  Made on Monday, October 5, 2009
  
  Press the mousebutton and drag the mouse to change the x position.
  
  This sketch uses a very linear movement.
  It would be nicer if the ball would speed up and slow down.
*/
 
// For the position of the ellipse we need 2 variables, one for the x and one for the y
float xPosition;
float yPosition;
float yDirection;

float xSize;
float ySize;
float yBounceSize;
float yBounceSizeTop;
float yBounceSizeBottom;

float yLineTop;
float yLineBottom;

float xLineStart;
float xLineEnd;
 
float xMouseStart;
float xMouseMove;
 
void setup() {
  size(400,200);
  frameRate(60);
  smooth();
 
  // We begin with the ellipse in the middle of the screen
  xPosition = width/2;
  yPosition = height/2;
  
  // the speed of the ball is a combination of yDirection and frameRate
  yDirection = 1.5;
  
  xSize = 50;
  ySize = 50;
  yBounceSize = ySize;
  yBounceSizeTop = yBounceSize;
  yBounceSizeBottom = yBounceSize;
}
 
void draw() {
  // draw the background
  background(204);
  rectMode(CENTER);
  
  // draw the ellipse
  noStroke();
  float percentage = (yPosition/(height/100));
  float red = (percentage/100)*255;
  float blue = 255-((percentage/100)*255);
  fill(red,0,blue);
  ellipse(xPosition, yPosition, xSize, yBounceSize);

  xLineStart=xPosition-(width*0.25);
  xLineEnd=xPosition+(width*0.25)-1;

  // the bottom lines  
  yLineBottom = height-(yBounceSizeBottom/2);
  
  strokeWeight(0);
  fill(255,0,0);
  rect(xPosition,yLineBottom+(yBounceSizeBottom/4),width*0.5,yBounceSizeBottom/2);

  strokeWeight(1);
  stroke(0);
  line(xLineStart,yLineBottom,xLineEnd,yLineBottom);
  line(xLineStart,yLineBottom+((yBounceSizeBottom/2)*0.2),xLineEnd,yLineBottom+((yBounceSizeBottom/2)*0.2));
  line(xLineStart,yLineBottom+((yBounceSizeBottom/2)*0.4),xLineEnd,yLineBottom+((yBounceSizeBottom/2)*0.4));
  line(xLineStart,yLineBottom+((yBounceSizeBottom/2)*0.6),xLineEnd,yLineBottom+((yBounceSizeBottom/2)*0.6));
  line(xLineStart,yLineBottom+((yBounceSizeBottom/2)*0.8),xLineEnd,yLineBottom+((yBounceSizeBottom/2)*0.8));
  
  // the top lines
  yLineTop = yBounceSizeTop/2;
    
  strokeWeight(0);
  fill(0,0,255);
  rect(xPosition,yBounceSizeTop/4,width*0.5,yBounceSizeTop/2);

  strokeWeight(1);
  stroke(0);
  line(xLineStart,yLineTop,xLineEnd,yLineTop);
  line(xLineStart,yLineTop-((yBounceSizeTop/2)*0.2),xLineEnd,yLineTop-((yBounceSizeTop/2)*0.2));
  line(xLineStart,yLineTop-((yBounceSizeTop/2)*0.4),xLineEnd,yLineTop-((yBounceSizeTop/2)*0.4));
  line(xLineStart,yLineTop-((yBounceSizeTop/2)*0.6),xLineEnd,yLineTop-((yBounceSizeTop/2)*0.6));
  line(xLineStart,yLineTop-((yBounceSizeTop/2)*0.8),xLineEnd,yLineTop-((yBounceSizeTop/2)*0.8));
   
  yPosition = yPosition + yDirection;
  
  if (yPosition >= height || yPosition <= 0) {
    yDirection = yDirection*(-1);
  }

  if (yPosition > height-ySize) {
    yBounceSize = height-yPosition;
    yBounceSizeBottom = yBounceSize;
  } else if (yPosition < ySize) {
    yBounceSize = yPosition;
    yBounceSizeTop = yBounceSize;
  }
}
 
void mousePressed() {
  xMouseStart = mouseX;
}

void mouseDragged() {
  xMouseMove = mouseX-xMouseStart;
  xMouseStart = mouseX;
  xPosition = constrain(xPosition + xMouseMove,width*0.25,width*0.75);
}


