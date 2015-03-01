
PImage ima;

void setup()
{
  size(256, 256);
  ima = loadImage("http://www.face.uc.edu.ve/postgrado/iconos/Etoile.png");
  //loststars
}

void draw()
{
  background(255);
  colorMode(HSB, 360, 100, 100);
  float hue = map(mouseX, 0, 900, 0, 255);

  tint(hue, 2*hue, 3*hue, 100);
  image(ima, 0, 0);
}

