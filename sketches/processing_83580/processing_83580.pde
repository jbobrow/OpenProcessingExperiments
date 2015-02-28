
color strokeColor, fillColor;
PVector ellipsePos, ellipseSize;

void setup()
{
  strokeColor = color(255,255,255);
  fillColor = color(0,128,255);
  ellipsePos = new PVector(0,0);
  ellipseSize = new PVector(50,50);
  
  size(400,400);
}

void draw()
{
  background(0,0,0);
  ellipsePos.x = ellipsePos.x+1;
  ellipsePos.y = ellipsePos.y+1;
  drawEllipse(strokeColor, fillColor, ellipsePos, ellipseSize);
}

void drawEllipse(color strClr, color flClr, PVector elPos, PVector elSize)
{
  stroke(strClr);
  fill(flClr);
  ellipse(elPos.x, elPos.y, elSize.x, elSize.y);  
}


