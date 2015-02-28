
//Created by Andrew Huang

drawn[] a;
boolean z, x;

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    z = true;
  }
  if (mouseButton == RIGHT)
  {
    x = true;
  }
}

void mouseReleased()
{
  z = false;
  x = false;
}

void setup()
{
  frameRate(23);
  background(0);
  size(600, 600);
  smooth();
  noStroke();
  a = new drawn[500];

  for (int i=0; i<500; i++)
  {
    a[i] = new drawn();
  }
  for (int i=0; i<500; i++)
  {
    a[i].x = random(-width, width);
    a[i].y = random(-height, height);
    a[i].s = 10;
    a[i].v = random(10);
  }
}

void draw()
{
  background(0);
  fill(255);
  for (int i=0; i<a.length; i++)
  {
    a[i].drew();
    a[i].go();
    if (z)
    {
      a[i].x= mouseX;
      a[i].y= mouseY;
    }
    if (x)
    {
      a[i].x = random(-width, width);
      a[i].y = random(-height, height);
    }
    if (a[i].x > 600) a[i].x = random(-5, 5);
    if (a[i].y > 600) a[i].y = random(-5, 5);
  }
}

class drawn
{
  float x, y, s, v;

  void drew()
  {
    ellipse(x, y, s, s);
  }

  void go()
  {
    x += (width/2) * 0.01 * v;
    y += (height/2) * 0.01 * v;
  }
}


