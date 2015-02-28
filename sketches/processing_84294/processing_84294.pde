
color strokeColor, fillColor;
PVector ellipsePos, ellipseSize;

void setup()
{
  strokeColor = color(255,255,255);
  fillColor = color(0,128,255);
  ellipsePos = new PVector(200,200);
  ellipseSize = new PVector(100,100);
  color bgColor = color(0,0,0);
  
  size(400,400);
  background(bgColor);
}

void draw()
{
  drawEllipse(strokeColor, fillColor, ellipsePos, ellipseSize);
}

void drawEllipse(color strClr, color flClr, PVector elPos, PVector elSize)
{
  stroke(strClr);
  fill(flClr);
  ellipse(elPos.x, elPos.y, elSize.x, elSize.y);  
}


