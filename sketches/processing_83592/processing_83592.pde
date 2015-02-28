
color strokeColor, fillColor;
PVector ellipsePos, ellipseSize, ellipseSpeed;

void setup()
{
  ellipsePos = new PVector(0,0);
  ellipseSize = new PVector(50,50);
  ellipseSpeed = new PVector(random(5),random(5));
  strokeColor = color(255,0,255);
  fillColor = color(0,255,0);
  size(500,500);
}

void draw()
{
  background(0,0,0);
  ellipsePos = updateEllipse(ellipsePos, ellipseSpeed, -2,2);
  drawEllipse(strokeColor, fillColor, ellipsePos, ellipseSize);
}

PVector updateEllipse(PVector oldPosition, PVector speed, float randomMin, float randomMax)
{
  PVector newPosition = new PVector(0,0);
  newPosition.x = oldPosition.x+speed.x+random(randomMin,randomMax);
  newPosition.y = oldPosition.y+speed.y+random(randomMin,randomMax);
  if(newPosition.x>width)
    newPosition.x=0;
  if(newPosition.y>height)
    newPosition.y=0;
  
  return newPosition;
}
void drawEllipse(color strClr, color flClr, PVector elPos, PVector elSize)
{
  if(elPos.x>150&&elPos.x<350)
  {
    stroke(flClr);
    fill(strClr);
  }
  else
  {
    stroke(strClr);
    fill(flClr);
  }
  
  ellipse(elPos.x, elPos.y, elSize.x, elSize.y);  
}


