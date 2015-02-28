
color brushColor;
PImage paletteImage;
float someScale = 1.0;
float someRotation = 0.07;

void setup()
{
  size (500, 500);
  paletteImage = requestImage("palette2.png");
}

void draw()
{
  
  if (paletteImage.width > 0)
  {
    image(paletteImage, 0, 0, 100, 100);
  }

  if (mousePressed == true)
  {
    fill(brushColor);
    if (mouseButton == RIGHT)
    {
      brushColor = get(mouseX, mouseY);
    }
    else if (mouseButton == LEFT)
    {
      pushMatrix();
      translate(mouseX, mouseY);
      rotate (someRotation);
      scale (someScale);
      triangle(30, 75, 58, 20, 86, 75);
      popMatrix();
    }
  }
  if (keyPressed)
  {
    if (key ==  '1')
    {
      someScale = (someScale + 0.1);
    }
    if (key == '2' && someScale > 0.1)
    {
      someScale = (someScale - 0.1);
    }
    if (key == '3')
    {
      someRotation = (someRotation + 0.1);
    }
  }
 
}



