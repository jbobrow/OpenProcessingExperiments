
color  brushColor;
PImage paletteImage;
float someScale = 1.0;
float someRotation = 0.0;
 
void setup()
{
  size(500, 500);
  paletteImage  = requestImage("g0000_palette.png");
  background(255);
}
 
 
void draw()
{
  noStroke();
  if (paletteImage.width > 0)
  {
    image(paletteImage, 0, 0, 100, 100);
  }
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      pushMatrix();
      translate(mouseX, mouseY);
      rotate(someRotation);
      scale(someScale);
      triangle(0, 0, random(100),  random(100),  random(100), random(100));
      popMatrix();
    }
    else if (mouseButton == RIGHT)
    {
      brushColor = get(mouseX, mouseY);
    }
     fill(brushColor);
  }
}
 
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      someScale = someScale + 1.0;
    }
    else if (keyCode == DOWN)
    {
      someScale = someScale - 1.0;
    }
    else if (keyCode == RIGHT)
    {
      someRotation = someRotation + 1.0;
    }
        else if (keyCode == LEFT)
    {
      someRotation = someRotation - 1.0;
    }
  }
}



