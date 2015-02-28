
//Lucky Wen, Ticklish Penguin, CP1 Mods 16/17

int x=0;
int y=0;
PImage b;
PImage v;
void setup()
{
  size(400, 410);
  b = loadImage("123456.jpg");
  image(b, 0, 0, 400, 400);
}
void draw()
{
  frameRate(3000);

  if (mousePressed ==true)
  {

    v = loadImage("electric-shock.jpg");
    image(v, x, y, 400, 400);
    x=x+int (random(-3, 3));
    y=y+int (random(-3, 3));
  }

  else
  {
    background(175);
    b = loadImage("123456.jpg");
    image(b, 0, 0, 400, 400);
  }
}



