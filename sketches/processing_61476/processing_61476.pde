
// 48-527 Project #2 | Mosaic
// Humaira Tasnim | htasnim | Copyright 2012
// Instructions: Click and drag your mouse over the image to give it a mosaic effect.
// You can also press any key to change the whole image to a mosaic.

PImage img;
int x;
int y;
int s = 20;

void setup()
{
  size (640, 640);
  smooth();
  noStroke();
  
  img = loadImage("pic.jpg");
  image (img, 0, 0);
  img.updatePixels();
  
  s = 20;
}

void draw()
{
  loadPixels();
  createMosaicManually();
  if (keyPressed)
  {
    createMosaic();
  }
}

void createMosaicManually()
{
  color c = get(mouseX, mouseY);
  fill(c);

  if (mousePressed)
  {
    x = mouseX - (mouseX % s);
    y = mouseY - (mouseY % s);
    rect (x, y, s, s);
  }
}

void createMosaic()
{
  for (int x = 0; x < img.width; x+=20)
  {
    for (int y = 0; y < img.height; y+=20)
    {
      color c = img.get(x, y);
      fill(c);
      rect (x, y, s, s);
    }
  }
}

