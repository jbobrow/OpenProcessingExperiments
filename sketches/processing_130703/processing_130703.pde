
PImage colors;
color brushColor;
float someScale = 1;
float someRotation = 0;

void setup()
{
  size(500,500);
  background(255);
  colors = requestImage("colors.gif");
}

void draw()
{
  noStroke();
  if (colors.width > 0)
  {
    image(colors, 0, 0, 150, 150);
  }
  
  
  if (mousePressed == true)
  {
      if (key == 'w')
  {
    someScale = someScale+1;
  }
    if (key == 's')
    {
      if (someScale > 1)
      { 
        someScale = someScale-1;
      }
    }
    if (key == '1')
    {
      someRotation = someRotation +1;
    }
    if (mouseButton == LEFT)
    {
      pushMatrix();
      fill(brushColor);
      translate(mouseX,mouseY);
      rotate(someRotation);
      scale(someScale);
      triangle(-10, -10, 10, -10, 0, 10);
      popMatrix();
    }
    if (mouseButton == RIGHT)
    {
      brushColor = get(mouseX,mouseY);
    }

}
}


