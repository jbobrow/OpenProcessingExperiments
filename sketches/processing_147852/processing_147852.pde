
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
  background(204);
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
  stroke(4);
  line(xLineStart,yLineBottom,xLineEnd,yLineBottom);
  line(xLineStart,yLineBottom+((yBounceSizeBottom/2)*0.2),xLineEnd,yLineBottom+((yBounceSizeBottom/2)*0.2));
  line(xLineStart,yLineBottom+((yBounceSizeBottom/2)*0.4),xLineEnd,yLineBottom+((yBounceSizeBottom/2)*0.4));
  line(xLineStart,yLineBottom+((yBounceSizeBottom/2)*0.6),xLineEnd,yLineBottom+((yBounceSizeBottom/2)*0.6));
  line(xLineStart,yLineBottom+((yBounceSizeBottom/2)*0.8),xLineEnd,yLineBottom+((yBounceSizeBottom/2)*0.8));
  yLineTop = yBounceSizeTop/10;
   strokeWeight(0);
  fill(0,0,255);
  rect(xPosition,yBounceSizeTop/4,width*0.5,yBounceSizeTop/2);
  strokeWeight(6);
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

