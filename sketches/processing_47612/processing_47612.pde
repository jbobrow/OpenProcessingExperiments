
PImage dorothy;
PImage wand;

boolean isDrawing = false;

void setup()
{
  size(500, 500);
  dorothy = loadImage("red_shoes.jpg");
  smooth();
}

void draw()
{
  image(dorothy, 0, 0);
  if (mousePressed)
  {
    wand = loadImage("wand.jpg");
    fill(#fef00b);
    image(wand, mouseX, mouseY);
  }
}









