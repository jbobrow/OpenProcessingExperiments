
PImage img;

void setup()
{
  size (400, 400);
  img = createImage (200, 200, ARGB);
  for (int i=0; i < img.pixels.length; i++) {
    img.pixels[i] = color(0, 90, 102, i%img.width * 2);
  }
}

void draw()
{
  background(0);
  image (img, 255, 255);
  image (img, mouseX-60, mouseY-60);
}

