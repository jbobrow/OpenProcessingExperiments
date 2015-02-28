
int xValue1 = 100;
int yValue1 = 100;


void setup() 
{  
  size(500, 500);
  background(0);
  frameRate(10);
  strokeWeight(8);
  stroke(0, 0, 250);
}

void draw() 
{
  if(xValue1 == 100) 
  {
    yValue1 = yValue1+10;
  }
  if(yValue1 == 400)
  {
    xValue1 = xValue1+10;
    yValue1 = 400;
  }
  if(xValue1 == 400)
  {
    xValue1 = 400;
    yValue1 = yValue1-10;
  }
  if(yValue1 <= 100) 
  {
    xValue1 = xValue1-10;
    yValue1 = 100;
  }
  point(xValue1, yValue1); 
}


