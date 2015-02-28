
color brushColor;
float triScale = 1;
float triRotate = 1;
PImage colorPalette;

void setup()
{
  size (750, 750);
  background(200);
  colorPalette = requestImage("ColorWheel-Base.png");
}

void draw()
{
  image( colorPalette, 0, 0, 200, 200);
  colorMode(HSB);
  fill(255, 0, 0);
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      
      fill( brushColor );
      pushMatrix();
      translate(mouseX, mouseY);
      scale(triScale);
      rotate(triRotate);
      triangle(0, 0, 25, 50, 60, 50);
      popMatrix();
    }
    if (mouseButton == RIGHT)
    {
      brushColor = get(mouseX, mouseY);
    }
  }
   if (keyPressed)
    {
      if (key == '1')
      {
        triScale = triScale + 0.1;
      }
      if (key == '2')
      {
        triScale = triScale - 0.1;
      }
      if (key == '3')
      {
        triRotate = triRotate + 0.1;
      }
      if (key == '4')
      {
        triRotate = triRotate - 0.1;
      }
      if (key == '5')
      {
        background(255);
      }
    }
}


