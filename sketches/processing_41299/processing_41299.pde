
PImage foto1;
PImage foto2;

void setup()
{
  size (500, 370);
  foto1 = loadImage("simpson2.gif");
  foto2 = loadImage("simpson3.gif");
}
void draw()
{
  background(120);
  image(foto1, 0, 0);
  image(foto2, 0, mouseY * -3);
}

