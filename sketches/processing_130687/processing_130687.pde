
color brushColor;
PImage paletteImage;

void setup()
{
  size(500, 500);
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
    if (mouseButton == RIGHT)
    {
      brushColor = get(mouseX, mouseY);
    }
  }
  stroke(brushColor);
  strokeWeight(10);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

