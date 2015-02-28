
PImage img;
int r, g, b, alfa;

void setup()
{
  size(512, 512);
  r=0;
  g=0;
  b=0;
  alfa=255;
  img = loadImage("landscape.jpeg");
}

void draw()
{
  r = mouseX/2;
  g = 255 - mouseX/2;
  b = mouseY/2;
  alfa = 255 - mouseY/2;

  tint(r, g, b, alfa);  // Tint blue and set transparency
  image(img, 0, 0);
}


