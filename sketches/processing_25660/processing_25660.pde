

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
  size(400,600);
  frameRate(50);
  xPosition = width-200;
  yPosition = height-200;
  yDirection = 5;
   
  xSize = 50;
  ySize = 50;
  yBounceSize = ySize;
  yBounceSizeTop = yBounceSize;
  yBounceSizeBottom = yBounceSize;
}
  
void draw() {
  background(0);
  strokeWeight(1);
  stroke (255);
  float percentage = (yPosition/(height/100));
  float red = (percentage/100)*255;
  float blue = 255-((percentage/100)*255);
  fill(red,0,blue);
  ellipse(xPosition, yPosition, xSize, yBounceSize);
 
 
    
  yPosition = yPosition + yDirection;
   
  if (yPosition >= height || yPosition <=1) {
    yDirection = yDirection*(-1);
  }
 
  
}
  

 

