
Seeker a, b, c, d, e;

void setup()
{
  size(600,600);
  smooth();
a = new Seeker();
  a.r = 25;
  a.v = 4;
  int col=#F51121;
  
  b = new Seeker();
  b.r = 30;
  b.v = 3;

  c = new Seeker();
  c.r = 10;
  c.v = 5;
  
  d = new Seeker();
  d.r = 50;
  d.v = 10;
  
  e = new Seeker();
  e.r = 70;
  e.v = 15;

  a.x = width/3;
  b.x = width/7;
  c.x = width/7;
  d.x = width/2;
  e.x = width/9;
  a.y = height/3;
  b.y = height/7;
  c.y = height/6;
  d.y = height/5;
  e.y = height/7;
  
}

void draw()
{
  background(#1361E5);
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
  int col= #F51121; //color
  void show()
  {
    fill(#1F29D8);
    ellipse(x,y, r,r);
    noFill();
  }

  void move()
  {
    x += ( mouseX - width/2 ) * 0.001 * v;
    y += ( mouseY - height/2 ) * 0.001 * v;
  }
}



