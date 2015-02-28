
//Hold left mouse key to see something cool :3//
Circle a, b, c, d, e, f, g;
float x, y;


void setup()
{
  size(600, 600);
  smooth();
  //strokeWeight(5);
  noStroke();

  a = new Circle();
  a.radi = 40;
  a.speed = 10;
  //a.filler1 = random(300.0);
  a.x = 300;


  b = new Circle();
  b.radi = 40;
  b.speed = 10;
  //b.filler2 = random(300.0);
  b.x = 200;

  c = new Circle();
  c.radi = 40;
  c.speed = 10;
  //c.filler3 = random(300.0);
  c.x = 400;

  d = new Circle();
  d.radi = 40;
  d.speed = 10;
  d.x = 500;

  e = new Circle();
  e.radi = 40;
  e.speed = 10;
  e.x = 100;

  f = new Circle();
  f.radi = 40;
  f.speed = 10;
  f.x = 0;

  g = new Circle();
  g.radi = 40;
  g.speed = 10;
  g.x = 600;
}

void draw()
{
  fill(0, 15);
  rect(0, 0, 600, 600);
  a.show();
  a.edge();
  a.move();
  b.show();
  b.edge();
  b.move();
  c.show();
  c.edge();
  c.move();
  d.show();
  d.edge();
  d.move();
  e.show();
  e.edge();
  e.move();
  f.show();
  f.edge();
  f.move();
  g.show();
  g.edge();
  g.move();
  
}

class Circle
{
  float x, y;
  int radi; // radius
  int speed; // speed
  float filler1, filler2, filler3; //color

  void show()
  {
    //fill(filler1, filler2, filler3);
    fill(255);
    ellipse(x, y, radi, radi);
  }

  void move()
  {
    if (mousePressed) x = random(600);
    else if (!mousePressed)
    {
      a.x = 300;
      b.x = 200;
      c.x = 400;
      d.x = 500;
      e.x = 100;
      f.x = 0;
      g.x = 600;
    }
    y = y - 5.0;
  }

  void edge()
  {
    if (x > width) x = 0;
    else if (y > height) y = 0;
    else if (y < 0) y = height;
    else if (x < 0) x = width;
  }
}


