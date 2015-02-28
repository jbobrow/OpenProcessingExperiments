
//Benson L, Mods 14-15 CP1, Pong
Paddle bob;
Paddle jill;
Ball jack;
int g = 0;
int h = 0;
void setup()
{
  size(600, 450);
  bob = new Paddle();
  jill = new Paddle();
  jill.a = 575;
  jack = new Ball();
  frameRate(120);
  textAlign(CENTER);
  textSize(50);
}
void draw()
{
  background(0);
  stroke(255, 0, 0);
  line(0, 0, 0, 450);
  line(599, 0, 599, 450);
  stroke(0);
  if (keyPressed == true)
  {
    if (key == 'w')
    {
      if(bob.z > 0)
      {
        bob.moveUp();
      }
    }
    if (key == 's')
    {
      if(bob.z < 375)
      {
        bob.moveDown();
      }
    }
  }
  if(jack.x > 490)
  {
    if(jack.up == true)
    {
      if(jill.z > 0)
      {
        jill.moveUp();
      }
    }
    else if(jack.up == false)
    {
      if(jill.z < 375)
      {
        jill.moveDown();
      }
    }
  }
  bob.show();
  jill.show();
  jack.move();
  jack.bounce();
  jack.show();
  int s = second();
  int m = minute();
  int h = hour();
  fill(255);
  text(h + ":" + m + ":" + s, 300, 50);
}
class Paddle
{
  int a, z;
  Paddle()
  {
    a = 15;
    z = 250;
  }
  void moveUp()
  {
    z = z - 3;
  }
  void moveDown()
  {
    z = z + 3;
  }
  void show()
  {
    fill(255);
    rect(a, z, 10, 75);
  }
}
class Ball
{
  int x, y, r, b, g;
  boolean up, right;
  Ball()
  {
    x = int(random(100, 326));
    y = int(random(100, 326));
    r = int(random(256));
    b = int(random(256));
    g = int(random(256));
    up = true;
    right = false;
  }
  void move()
  {
    if (right == true)
    {
      x = x + 2;
    }
    else if (right == false)
    {
      x = x - 2;
    }
    if (up == true)
    {
      y = y - 2;
    }
    else if (up == false)
    {
      y = y + 2;
    }
  }
  void bounce()
  {
    if (get(x-21, y) != color(0))
    {
      r = int(random(256));
      b = int(random(256));
      g = int(random(256));
      right = true;
    }
    else if (get(x+21, y) != color(0))
    {
      right = false;
      r = int(random(256));
      b = int(random(256));
      g = int(random(256));
    }
    if (y > 430)
    {
      up = true;
      r = int(random(256));
      b = int(random(256));
      g = int(random(256));
    }
    else if (y < 20)
    {
      up = false;
      r = int(random(256));
      b = int(random(256));
      g = int(random(256));
    }
  }
  void show()
  {
    fill(r,b,g);
    ellipse(x, y, 40, 40);
  }
}
