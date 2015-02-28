
ball phillip;
ball a;
ball b;
ball c;
ball az;
ball bz;
ball cz;
void setup()
{
  size(400, 400);
  background(0, 225, 0);
  phillip = new ball();
  a = new ball();
  b = new ball();
  c = new ball();
  az = new ball();
  bz = new ball();
  cz = new ball();
}
void draw()
{
  background(0, 225, 0);
  //background(random(0,225),random(0,225),random(0,225));
  phillip.move();
  phillip.display();
  phillip.bounce();
  a.move();
  a.display();
  a.bounce();
  b.move();
  b.display();
  b.bounce();
  c.move();
  c.display();
  c.bounce();
  az.move();
  az.display();
  az.bounce();
  bz.move();
  bz.display();
  bz.bounce();
  cz.move();
  cz.display();
  cz.bounce();
}
class ball
{
  float mx = random(-5, 4);
  float my = random(-5, 4);
  float x, y;
  ball()
  {
    x = random(15, 386);
    y = random(15, 386);
  }
  void move()
  {
    x = x + mx;
    y = y + my;
  }
  void display()
  {
    noStroke();
    //fill(225, 225, 225);
    fill(random(0,225),random(0,225),random(0,225));
    ellipse(x, y, 10, 10);
  }
  void bounce()
  {
    if (dist(x, y, 0.0, y) <= 10.0 || dist(x, y, 400.0, y) <= 10.0)
    {
      mx = -mx;
      
    }
    if (dist(x, y, x, 0.0) <= 10.0 || dist(x, y, x, 400.0) <= 10.0)
    {
      my = -my;
    }
  }
}
