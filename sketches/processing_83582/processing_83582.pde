
color strokeColor, fillColor;
PVector ellipsePos, ellipseSize, ellipseSpeed;

void setup()
{
  strokeColor = color(255,255,255);
  fillColor = color(0,128,255);
  ellipsePos = new PVector(0,0);
  ellipseSize = new PVector(50,50);
  ellipseSpeed = new PVector(random(2),random(2));
  
  size(600,600);
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
  return newPosition;
}
void drawEllipse(color strClr, color flClr, PVector elPos, PVector elSize)
{
  stroke(strClr);
  fill(flClr);
  ellipse(elPos.x, elPos.y, elSize.x, elSize.y);  
}


