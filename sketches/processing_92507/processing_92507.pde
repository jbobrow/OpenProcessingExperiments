
/**
* Seekers
* by Chuck Norris
**/

Seeker a, b, c, d, e;

void setup()
{
  size(600,600);
  smooth();

  a = new Seeker();
  a.t = 40;
  a.v = 2;

  b = new Seeker();
  b.t = 30;
  b.v = 3;

  c = new Seeker();
  c.t = 10;
  c.v = 5;
  
  d = new Seeker();
  d.t = 20;
  d.v = 4;
  
  e = new Seeker();
  e.t = 50;
  e.v = 6;

  a.x = b.x = c.x = d.x = e.x = width/2;
  a.y = b.y = c.y = d.y = e.y = height/2;
}

void draw()
{
  background(0);
  a.move();
  b.move();
  c.move();
  d.move();
  e.move();
  a.show();
  b.show();
  c.show();
  d.show();
  e.show();
}

class Seeker
{
  float x, y;
  int t; // tama�o
  int v; // velocidad

  void show()
  {
    ellipse(x,y, t,t);
    fill(random(0,255),random(0,255),random(0,255));
  }

  void move()
  {
    x +=  ( mouseX - width/2 ) * 0.001 * v;
    y +=  ( mouseY - height/2 ) * 0.001 * v;
  }
}


