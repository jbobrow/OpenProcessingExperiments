
void setup()
{
  size(200,200);
  background(255);
}

void draw()
{
  drawHouse(100,100);
}

void drawHouse(int centerX, int centerY)
{
  if(mouseX< 90 || mouseX> 110 || mouseY<90 || mouseY>110)
  {
  rect(centerX-50,centerY-25,100,100);
  rect(centerX-10,centerY+50,20,25);
  triangle(centerX,centerY-60,centerX-50,centerY-25,centerX+50,centerY-25);
  ellipse(centerX-25,centerY,20,20);
  ellipse(centerX+25,centerY,20,20);
  }

else
{
  background(255);
}
}
