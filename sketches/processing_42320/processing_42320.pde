
/*
Marvin Yan
 The circles make a wave...get it? got it? good.
 
 
 */
int s = 5;
Circle[] a;

void setup () 
{
  size (360, 360);
  ellipseMode (CENTER);
  smooth();
  noStroke();
  a = new Circle[36];

  for (int i = 0; i < a.length; i++)
  {
    a[i] =new Circle();
    a[i].x = 10*i;
    a[i].y = 180;
    a[i].angle2 = 5;
    a[i].r = 20;
    a[i].angle = 10*i;
  }
}

void draw ()
{
  background (0, 0, 255);
  for (int i = 0; i < a.length; i++) 
  {
    a[i].movement();
    a[i].show();
  }
}


class Circle 
{
  float x, y, r;
  float angle, angle2;

  void movement() 
  {
    angle += angle2;
  }

  void show() 
  {
    y = s*36*sin(radians(angle+angle2)) + s * 36;
    fill (random (255));
    ellipse (x, y, r*2, r*2);
  }
}


