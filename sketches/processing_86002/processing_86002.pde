
Seeker a, b, c, d, e;

void setup()
{
  size(600,600);
  smooth();

  a = new Seeker();
  a.r = 40;
  a.v = 2;
  a.colour = #ED1D1D;
  
  b = new Seeker();
  b.r = 30;
  b.v = 3;
  b.colour = #270CA5;

  c = new Seeker();
  c.r = 10;
  c.v = 5;
  c.colour = #00E85E;
  
  d = new Seeker();
  d.r = 20;
  d.v = 4;
  d.colour = #E3CD07;
  
  e = new Seeker();
  e.r = 35;
  e.v = 8;
  e.colour = #13F0D4;

  a.x = width/6;
  b.x = width/60;
  c.x = width/4;
  d.x = width/2;
  e.x = width/8;
  a.y = height/2;
  b.y = height/4;
  c.y = height/6;
  d.x = height/8;
  e.x = height/10;
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
  int r; // size (r for radius)
  int v; // velocity
  int colour;

  void show()
  {
    fill (colour);
    ellipse(x,y, r,r);
  }

  void move()
  {
    x += ( mouseX - width/2 ) * 0.001 * v;
    y += ( mouseY - height/2 ) * 0.001 * v;
  }
}

