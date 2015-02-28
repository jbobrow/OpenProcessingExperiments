
/* @pjs preload= "Color Wheel.png"; */

color brushColor;
PImage paletteImage;
float someScale = 1;
float someRotation = 1;

void setup()
{
  size(400,400);
  paletteImage = requestImage("Color Wheel.png");
}

void draw()
{
  if (paletteImage.width > 0)
  {
    image(paletteImage, 0, 0, 100, 100);
  }
  if (mousePressed == true)
  {
    if (mouseButton == RIGHT)
    {
      brushColor = get(mouseX, mouseY);
    }
  }
  if (keyPressed == true)
  {
    if (keyCode == UP)
    {
      someScale = someScale + .05;
    }
    else if (keyCode == DOWN)
    {
      if (someScale > .05)
      {
        someScale = someScale - .05;
      }
    }
     if (keyCode == RIGHT)
     {
       someRotation = someRotation + .05;
     }
    else if (keyCode == LEFT)
   {
    someRotation = someRotation - .05; 
   }
  }
  fill(brushColor);
  line(pmouseX, pmouseY, mouseX, mouseY);
  
  pushMatrix();
  translate(mouseX, mouseY);
  scale(someScale);
  rotate(someRotation);
  fill(brushColor);
  triangle(0,0,200,0,0,200);
  popMatrix();
}


