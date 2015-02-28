
int circleRow = 4;
int circleColumn = 4;
int distance = 100;
int numCircles = 10;
int diam = 80;
size(500, 500);
int centerX = distance;
int centerY = distance;
smooth();
stroke(246,38,23);
strokeWeight(4);
fill(255);
background(0);

for (int rowIndex = 0; rowIndex < circleRow; rowIndex++)
{
  for (int columnIndex = 0; columnIndex < circleColumn; columnIndex++)
  {
    for(int i = 0; i < numCircles/2; i++)
    {
      //fill(255);
      
      ellipse(centerX, centerY, diam, diam);
      diam -= 17;
    }
    diam = 80;
    centerX += distance;
  }
  centerX = distance;
  centerY += distance;
}

                
                
