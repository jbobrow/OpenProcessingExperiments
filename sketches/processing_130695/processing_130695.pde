
color brushColor;
PImage paletteImage;
float someRotate;
float someScale;

void setup()
{
  size(500, 500);
  paletteImage = requestImage("paletteimage2.png");
}

void draw()
{
  if(paletteImage.width > 0)
  {
    image(paletteImage, 0, 0, 100, 100);
  }
  if(mousePressed == true)
  {
    if(mouseButton == RIGHT)
    {
      brushColor = get(mouseX, mouseY);
    }
  }
  if(key == CODED)
  {
    if(keyCode == RIGHT)
    {
      someRotate += 1;
      someScale += 1;
    }
    else if (keyCode == LEFT)
    {
      someRotate -= 1;
      someScale -= 1;
    }
    rotate(PI);
  }
  fill(brushColor);
  if(mousePressed == true)
  {
    if(mouseButton == LEFT)
    {
     pushMatrix();
     rotate(someRotate);
     translate(mouseX, mouseY);
     scale(someScale);
     triangle(0, 0, 20, 0, 0, 20);
     popMatrix();
    }
  }
}


