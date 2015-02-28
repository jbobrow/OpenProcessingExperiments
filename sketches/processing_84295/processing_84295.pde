
color strokeColor, fillColor;
PVector posA, posB;
PVector sizeA, sizeB;

void setup()
{
  strokeColor = color(255,255,255);
  fillColor = color(0,128,255);
  posA = new PVector(100,100);
  posB = new PVector(300,300);
  sizeA = new PVector(100,100);
  sizeB = new PVector(80,80);
  color bgColor = color(0,0,0);
  
  size(400,400);
  background(bgColor);
}

void draw()
{
  int lineSize = 3;
  drawEllipse(strokeColor, lineSize, fillColor, posA, sizeA);
  drawRectangle(strokeColor, lineSize, fillColor, posB, sizeB);  
}

void drawEllipse(color strClr, int strWeight, color flClr, PVector elPos, PVector elSize)
{
  stroke(strClr);
  strokeWeight(strWeight);
  fill(flClr);
  ellipse(elPos.x, elPos.y, elSize.x, elSize.y);  
}

void drawRectangle(color strClr, int strWeight, color flClr, PVector rectPos, PVector rectSize)
{
  stroke(strClr);
  strokeWeight(strWeight);
  fill(flClr);
  rect(rectPos.x, rectPos.y, rectSize.x, rectSize.y);  
}


