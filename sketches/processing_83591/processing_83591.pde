
color strokeColor, fillColor;
PVector ellipsePos, ellipseSize, ellipseSpeed;

void setup()
{
  strokeColor = color(192,128,0);
  fillColor = color(192,0,255);
  ellipsePos = new PVector(0,0);
  ellipseSize = new PVector(80,80);
  ellipseSpeed = new PVector(random(5),random(5));
  
  size(500,500);
}

void draw()
{
  background(0,0,0);
  ellipsePos = updateEllipse(ellipsePos, ellipseSpeed, -2,2);
  if(ellipsePos.x>width)
    ellipsePos.x=0;
  if(ellipsePos.y>height)
    ellipsePos.y=0;
  drawEllipse(strokeColor, fillColor, ellipsePos, ellipseSize);
}

PVector updateEllipse(PVector oldPosition, PVector speed, float randomMin, float randomMax)
{
  PVector newPosition = new PVector(0,0);
  newPosition.x = oldPosition.x+speed.x+random(randomMin,randomMax);
  newPosition.y = oldPosition.y+speed.y+random(randomMin,randomMax);
  return newPosition;
}
void drawEllipse(color strClr, color flClr, PVector elPos, PVector elSize)
{
  stroke(strClr);
  fill(flClr);
  ellipse(elPos.x, elPos.y, elSize.x, elSize.y);  
}


