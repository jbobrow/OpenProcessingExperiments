
int circleRow = 9;
int circleColumn = 9;
int distance = 50;
int diam = 5;
size(500, 500);
int alphaChannel = 255;
int centerX = distance;
int centerY = distance;
smooth();
background(0);

for (int rowIndex = 0; rowIndex < circleRow; rowIndex++)
{
  fill(79, 252, 237, alphaChannel);
  for (int columnIndex = 0; columnIndex < circleColumn; columnIndex++)
  {
    ellipse(centerX, centerY, diam, diam);
    centerX += distance;
    diam += 4;
  }
  centerX = distance;
  centerY += distance;
  diam = 5;
  alphaChannel-=28;
}              
                
