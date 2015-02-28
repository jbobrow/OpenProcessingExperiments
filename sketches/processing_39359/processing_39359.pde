
raindrops a, b, c, d, e, f, g, h, i, j, k;
bouncingball a1,b1,c1;

void setup()
{
  size(500, 500);
  smooth();

  a = new raindrops();
  a.r = 64;
  a.g = 196;
  a.b = 255;
  a.o = random(50, 100);

  b = new raindrops();
  b.r = 64;
  b.g = 196;
  b.b = 255;
  b.o = random(50, 100);

  c = new raindrops();
  c.r = 64;
  c.g = 196;
  c.b = 255;
  c.o = random(50, 100);

  d = new raindrops();
  d.r = 64;
  d.g = 196;
  d.b = 255;
  d.o = random(50, 100);

  e = new raindrops();
  e.r = 64;
  e.g = 196;
  e.b = 255;
  e.o = random(50, 100);
  f = new raindrops();
  f.r = 64;
  f.g = 196;
  f.b = 255;
  f.o = random(50, 100);

  g = new raindrops();
  g.r = 64;
  g.g = 196;
  g.b = 255;
  g.o = random(50, 100);

  h = new raindrops();
  h.r = 64;
  h.g = 196;
  h.b = 255;
  h.o = random(50, 100);

  i = new raindrops();
  i.r = 64;
  i.g = 196;
  i.b = 255;
  i.o = random(50, 100);

  j = new raindrops();
  j.r = 64;
  j.g = 196;
  j.b = 255;
  j.o = random(50, 100);

  k = new raindrops();
  k.r = 64;
  k.g = 196;
  k.b = 255;
  k.o = random(50, 100);
  
  a1 = new bouncingball();
  a1.r = 64;
  a1.g = 196;
  a1.b = 255;
  a1.xpos = random(100,250)/random(1,3);
  a1.ypos = random(250,0)/random(1,3);
  a1.xSpeed = random(1,5);
  a1.size = random(25,75);
  
  b1 = new bouncingball();
  b1.r = 64;
  b1.g = 196;
  b1.b = 255;
  b1.xpos = random(250,425)/random(1,3);
  b1.ypos = random(250,0)/random(1,3);
  b1.xSpeed = random(1,5);
  b1.size = random(25,75);
  
  c1 = new bouncingball();
  c1.r = 64;
  c1.g = 196;
  c1.b = 255;
  c1.xpos = random(250,425)/random(1,3);
  c1.ypos = random(250,0)/random(1,3);
  c1.xSpeed = random(1,5);
  c1.size = random(25,75);
}

void draw()
{  
  fill(0, 15);
  rect(0, 0, 500, 500);
  a.show();
  b.show();
  c.show();
  d.show();
  e.show();
  f.show();
  g.show();
  h.show();
  i.show();
  j.show();
  k.show();
  a1.show1();
  b1.show1();
  c1.show1();
  a.drip();
  b.drip();
  c.drip();
  d.drip();
  e.drip();
  f.drip();
  g.drip();
  h.drip();
  i.drip();
  j.drip();
  k.drip();
  a1.bounce();
  b1.bounce();
  c1.bounce();
  a1.move();
  b1.move();
  c1.move();
}
class raindrops
{
  float x, y, sx, sy, r, g, b, o, rainAmount;

  void show()
  {
    noStroke();
    fill(r, g, b, o);
    rect(x, y, 3, 20);
  }
  void drip()
  {
    x =random(0, 500);
    y =random(0, 500);
  }
}

class bouncingball
{
  float size;
  float xSpeed = 3;
  float ySpeed = 2;
  float xpos, ypos;
  int xDirection = 1;
  int yDirection = 1;
  float r, g, b;

  void show1()
  {
    fill(r, g, b);
    ellipse(xpos+size/2, ypos+size/2, size, size);    
  }
    void bounce()
    {
      if (xpos > width-size || xpos < 0)
      {  
        xDirection *= -1;
      }
      if (ypos > height-size || ypos < 0)
      { 
        yDirection *= -1;
      }
    }
    void move()
    {
      xpos += (xSpeed * xDirection);
      ypos += (ySpeed * yDirection);
    }
  }


