
/**
 *Falling Petals
 *by Fu Huang
 *
 *Emergent Behaviors - Petals falling
 *
 */

Circles[] c;

void setup()
{
  size(500, 500);
  smooth();
  noStroke();

  c = new Circles[510];
  for (int i=0; i<510; i++)
  {
    c[i] = new Circles();
    c[i].x = random(500);
    c[i].y = random(60);
    c[i].w = random(5, 20);
    c[i].h = random(5, 20);
  }
}

void draw()
{
  background(255);

  println(mouseX+10);
  for (int i=0; i<mouseX+10; i++)
  {
    c[i].show();
    c[i].move();
  }

  for (int i=0; i<mouseX+10; i++)
  {
    c[i].howred = 255;
    c[i].howgreen = random(20, 50);
    c[i].howblue = random(20, 50);
  }
  if (c[mouseX+10].y > 500);
  {
    c[mouseX+10].y = random(60);
  }
}
class Circles
{
  float x, y;
  float w, h;
  float howred, howgreen, howblue;

  void show()
  {
    fill(howred, howgreen, howblue);
    ellipse(x, y, w, h);
  }

  void move()
  {
    x+= random (-7, 7);
    y+= random(4, 6);
  }
}


