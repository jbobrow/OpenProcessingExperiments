
void setup()
{
  size(600,400);
  frameRate(15);
}

void draw() {
  drawRandomlyColoredCircles(20, 30);
}

void drawRandomlyColoredCircles(int numberOfCircles, int theSize){
  int theCurrentSize;
  for (int i = numberOfCircles; i>=0; i--) {
    fill(random(255), random(255), random(255));
    theCurrentSize = calculateSize(theSize, i);
    ellipse(width/2, height/2, theCurrentSize, theCurrentSize);
  }
}
 

int calculateSize(int baseSize, int currentIndex) {
 //theSize + i*30;
 int theResult = baseSize + currentIndex*30 + mouseX;
  return (theResult); 
}

/*void ellipse(int xPos, int yPos, int ellipseWidth, int ellipseHeight) {

  //draws the ellipse
}*/





