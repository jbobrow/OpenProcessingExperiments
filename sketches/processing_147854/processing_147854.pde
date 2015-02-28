
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
void setup() {
  size(250,300);
  frameRate(60);
  smooth();
  xPosition = width/2;
  yPosition = height/2;
  yDirection = 1.5;
  xSize = 50;
  ySize = 50;
  yBounceSize = ySize;
  yBounceSizeTop = yBounceSize;
  yBounceSizeBottom = yBounceSize;
}
  void draw() {
  background(230);
  rectMode(CENTER);
  noStroke();
  float percentage = (yPosition/(height/100));
  float green = (percentage/100)*255;
  float orange = 255-((percentage/100)*255);
  fill(green,0,orange);
  ellipse(xPosition, yPosition, xSize, yBounceSize);
 xLineStart=xPosition-(width*0.25);
  xLineEnd=xPosition+(width*0.25)-1;
  yLineBottom = height-(yBounceSizeBottom/2);
   strokeWeight(0);
  fill(100,0,0);
  rect(xPosition,yLineBottom+(yBounceSizeBottom/4),width*0.5,yBounceSizeBottom/2);
 strokeWeight(2);
 yLineTop = yBounceSizeTop/10;
   strokeWeight(0);
  fill(0,0,255);
  rect(xPosition,yBounceSizeTop/4,width*0.5,yBounceSizeTop/2);
  strokeWeight(6);
  stroke(0);
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
  


