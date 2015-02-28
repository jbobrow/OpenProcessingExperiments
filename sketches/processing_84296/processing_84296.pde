
color strokeColor, fillColor;

void setup()
{
  strokeColor = color(255,255,255);
  fillColor = color(0,128,255);
  color bgColor = color(0,0,0);
  
  size(500,500);
  background(bgColor);
}

void draw()
{
  drawEllipse(strokeColor, 1, fillColor, new PVector(20,50), new PVector(10,10));
  drawRectangle(strokeColor, 5, fillColor, new PVector(30,50), new PVector(50,50));  
  
  drawEllipse(strokeColor, 2, fillColor, new PVector(120,150), new PVector(20,20));  
  drawRectangle(strokeColor, 4, fillColor, new PVector(140,150), new PVector(40,40));  
  
  drawEllipse(strokeColor, 3, fillColor, new PVector(220,250), new PVector(30,30));
  drawRectangle(strokeColor, 3, fillColor, new PVector(250,250), new PVector(30,30));  
  
  drawEllipse(strokeColor, 4, fillColor, new PVector(320,350), new PVector(40,40));
  drawRectangle(strokeColor, 2, fillColor, new PVector(360,350), new PVector(20,20));  
  
  drawEllipse(strokeColor, 5, fillColor, new PVector(420,450), new PVector(50,50));
  drawRectangle(strokeColor, 1, fillColor, new PVector(470,450), new PVector(10,10));
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


