
/*
Fish Tank.

  by David Situ
 
 Click for fish food!. 
 
 */
fish a, b, c, d, e, f, g, h;
void setup()
{
  size(600, 600);
  smooth();

  a=new fish();
  a.x=round(random(600));
  a.y=round(random(600));
  a.c=#0000FF;
  a.s=10;
  a.s2=30;
  a.p1=round(random(600));
  a.p2=round(random(600));
  a.p=3;

  b=new fish();
  b.x=round(random(600));
  b.y=round(random(600));
  b.c=#FF0000;
  b.s=10;
  b.s2=30;
  b.p1=round(random(600));
  b.p2=round(random(600));
  b.p=3;

  c=new fish();
  c.x=round(random(600));
  c.y=round(random(600));
  c.c=#FFFF00;
  c.s=10;
  c.s2=30;
  c.p1=round(random(600));
  c.p2=round(random(600));
  c.p=4;

  d=new fish();
  d.x=round(random(600));
  d.y=round(random(600));
  d.c=#00FF00;
  d.s=10;
  d.s2=30;
  d.p1=round(random(600));
  d.p2=round(random(600));
  d.p=5;

  e=new fish();
  e.x=round(random(600));
  e.y=round(random(600));
  e.c=#aa00FF;
  e.s=10;
  e.s2=30;
  e.p1=round(random(600));
  e.p2=round(random(600));
  e.p=3;

  f=new fish();
  f.x=round(random(600));
  f.y=round(random(600));
  f.c=#FFAF00;
  f.s=10;
  f.s2=30;
  f.p1=round(random(600));
  f.p2=round(random(600));
  f.p=3;

  g=new fish();
  g.x=round(random(600));
  g.y=round(random(600));
  g.c=#000000;
  g.s=10;
  g.s2=30;
  g.p1=round(random(600));
  g.p2=round(random(600));
  g.p=3;

  h=new fish();
  h.x=round(random(600));
  h.y=round(random(600));
  h.c=#FFFFFF;
  h.s=10;
  h.s2=30;
  h.p1=round(random(600));
  h.p2=round(random(600));
  h.p=4;
}

void draw()
{
  PImage tank;
  tank = loadImage("tank.bmp");
  fill(255);
  rect(0, 0, width, height);
  background(tank);

  a.show();
  b.show();
  c.show();
  d.show();
  e.show();
  f.show();
  g.show();
  h.show();
  a.swim();
  b.swim();
  c.swim();
  d.swim();
  e.swim();
  f.swim();
  g.swim();
  h.swim();
}

class fish
{
  float x, y, p1, p2;
  int s, s2, c, p;
  boolean l, r, f;

  void show()
  {
    noStroke();
    fill(c);
    if (x>p1)
    {
      ellipse(x, y, s2, s);
      triangle(x+s2/2, y, x+5+s2/2, y+5, x+5+s2/2, y-5);
      l=true;
    }
    else
    {
      l=false;
    }
    if (x<p1)
    {
      ellipse(x, y, s2, s);
      triangle(x-s2/2, y, x-5-s2/2, y+5, x-5-s2/2, y-5);
      r=true;
    }
    else
    {
      r=false;
    }
    if (l==false && r==false)
    {
      if (y>p2)
      {
        ellipse(x, y, s, s2);
        triangle(x, y+s2/2, x+5, y+5+s2/2, x-5, y+5+s2/2);
      }
    }
    if (l==false && r==false)
    {
      if (y<p2)
      {
        ellipse(x, y, s, s2);
        triangle(x, y-s2/2, x+5, y-5-s2/2, x-5, y-5-s2/2);
      }
    }
    if (mousePressed)
    {
      p1=mouseX;
      p2=mouseY;
      p1=round(p1);
      p2=round(p2);
      f=true;
    }
    if (f)
    {
      fill(147, 104, 76);
      rect(p1, p2, 5, 5);
    }
  }

  void swim()
  {
    if (x>p1)
    {
      x=x+round(random(-p-1, 0));
    }
    if (x<p1)
    {
      x=x+round(random(0, p-1));
    }
    if (y>p2)
    {
      y=y+round(random(-p, 0));
    }
    if (y<p2)
    {
      y=y+round(random(0, p+1));
    }
    if (x==p1 && y==p2)
    {
      p1=round(random(600));
      p2=round(random(600));
      f=false;
    }
  }
}


