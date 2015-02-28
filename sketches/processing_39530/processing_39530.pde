
//Created by Andrew Huang

//import processing.opengl.*;

shapes a, b, c, d, e, f, g;
boolean Z, X;

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    Z = true;
  }
  if (mouseButton == RIGHT)
  {
    X = true;
  }
}

void mouseReleased()
{
  Z = false;
  X = false;
}

void setup()
{
  smooth();
  size (600, 600, P3D);
  noStroke();

  a = new shapes();
  a.p = 175;
  a.s = 350;
  a.minimum = 175;
  a.maximum = 255;
  a.opacity = random (0, 15);

  b = new shapes();
  b.p = 150;
  b.s = 300;
  b.minimum = 175;
  b.maximum = 255;
  b.opacity = random (0, 15);

  c = new shapes();
  c.p = 125;
  c.s = 250;
  c.minimum = 175;
  c.maximum = 255;
  c.opacity = random (0, 15);

  d = new shapes();
  d.p = 100;
  d.s = 200;
  d.minimum = 175;
  d.maximum = 255;
  d.opacity = random (0, 15);

  e = new shapes();
  e.p = 75;
  e.s = 150;
  e.minimum = 175;
  e.maximum = 255;
  e.opacity = random (0, 15);

  f = new shapes();
  f.p = 50;
  f.s = 100;
  f.minimum = 175;
  f.maximum = 255;
  f.opacity = random (0, 15);

  g = new shapes();
  g.p = 25;
  g.s = 50;
  g.minimum = 175;
  g.maximum = 255;
  g.opacity = random (0, 15);
}

void draw()
{
  fill (0);
  /*text ( "BLUE IS THE DEFAULT COLOR" , 20, 20);
  text ( "LEFT CLICK AND HOLD TO CHANGE TO GREEN" , 20, 40);
  text ( "RIGHT CLICK AND HOLD TO CHANGE TO RED" , 20, 60);*/
  fill (0, 12);
  rect ( -10, -10, 610, 610);
  a.obj();
  b.obj();
  c.obj();
  d.obj();
  e.obj();
  f.obj();
  g.obj();
}

class shapes
{
  float p, s; // position and size
  float opacity, minimum, maximum;

  void obj()
  {
    stroke (0, 0, random (minimum, maximum), 12);
    fill (0, 0, random(minimum, maximum), opacity);
    if (Z)
    {
      stroke (0, random (minimum, maximum), 0, 12);
      fill (0, random(minimum, maximum), 0, opacity);
    }
    if (X)
    {
      stroke (random (minimum, maximum), 0, 0, 12);
      fill (random (minimum, maximum), 0, 0, opacity);
    }
    rect ( mouseX - p, mouseY - p, s, s);
    rotateZ ((mouseX-300) * 0.001);
  }
}


