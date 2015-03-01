
int circleSize = 0;
int circleX = 100;
int circleY = 100;
int timeCounter = 100;

int backgroundColor = 0;
int fillColor = 255;


void setup() {
  size(200,200);
}

void draw() {
  if(timeCounter == 0)
  {
    flipColor();
    resetCircleSize();
    
    timeCounter = 100;
  }
  
    background(backgroundColor);
    stroke(150);
    noStroke ();
    fill(fillColor);
    ellipse(circleX, circleY, circleSize, circleSize);
  
    circleSize = circleSize + 3;
  
  timeCounter--;

}

void flipColor()
{
   backgroundColor = 255 - backgroundColor;
  fillColor = 255 - fillColor;
}

void resetCircleSize()
{
  circleSize = 0;
}

/*
  int isWhite = 1;
  //Drew one
  isWhite = isWhite * (-1);
  
  int counter = 100;
  counter--;
  
  
*/


