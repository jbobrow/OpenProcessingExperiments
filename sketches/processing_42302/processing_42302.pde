
//Hold mouse button to gather ellipses.

Bird []a;

void setup()
{
  size(600, 600);
  smooth();
  fill(100);


  a = new Bird[100];
  for (int i=0; i<a.length; i++)
  {
    a[i] = new Bird();
    a[i].x = mouseX;
    a[i].y = mouseY;
    a[i].d = (int)random(5, 10);
    a[i].v = (int)random(20, 40);
    a[i].c = color(150, 50, 100, 200);
  }
}

void draw()
{
  background(0);
  fill(150, 0, 0);
  stroke(100);

  for (int i=0; i<a.length; i++)
  {
    a[i].move();
    a[i].show();
  }

  for (int i=0; i<a.length; i++)
  {
    if (mousePressed)
    {
      a[i].x = mouseX + random(-40, 50);
      a[i].y = mouseY + random(-40, 50);
    }
  }
}
class Bird
{
  float x, y;
  int d;
  int v;
  color c;

  void show()
  {
    fill(c);
    ellipse(x, y, d, d);
    if (x>600) x = 0;
    if (x<0) x = 600;
    if (y>600) y = 0;
    if (y<0) y = 600;
  }

  void move()
  {
    x += (random(-2, 2)) * 0.1 * v;
    y += (random(-2, 2)) * 0.1 * v;
    /*x += (mouseX - width/2) * 0.1 * v;
    y += (mouseY - width/2) * 0.1 * v;*/
    
  }
}


