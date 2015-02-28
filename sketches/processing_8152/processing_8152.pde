
// Keith O'Hara <kohara@bard.edu>
// Feb 8 2010 Lecture

float x, y;
float speed = .05;
PImage face;

void setup()
{
  size(500, 500);
  smooth();
  //http://www.openclipart.org/detail/734
  face = loadImage("face.png");
  x = width/2;
  y = height/2;
}

void draw()
{
  background(100, 80, 80);
  float dx = speed*(mouseX - x);
  x = x + dx;
  float dy = speed*(mouseY - y);
  y = y + dy;
  image(face, x, y, 75, 75);
}


