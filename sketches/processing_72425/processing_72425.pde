
//Montana Cruz, CP1

PImage a;
PImage b;
float x = 50;
float y = 50;


void setup()
{
  size (600, 600);
  background(240, 230, 230);
  a = loadImage("http://wow.wolfdragon.net/wp-content/uploads/not-so-happy-face.thumbnail.jpg");
  b = loadImage("http://upload.wikimedia.org/wikipedia/commons/e/ec/Happy_smiley_face.png");
}




void draw()
{
  background(0);
  image(b, x, y, 500, 500);
  if (mousePressed == true)
  {
    x = x + random(-10, 10);
    y = y + random(-10, 10);
  }
  else
  {
    background(240,230,230);
    image(a, x, y, 500, 500);
  }
}
