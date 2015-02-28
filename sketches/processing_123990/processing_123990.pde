
Celda[] c;
 
void setup()
{
  size(470, 470);
  smooth(56);
  fill(255);

  c = new Celda[50];
  for (int i=0; i<50; i++)
  {
    c[i] = new Celda();
    c[i].y = random(-height, height);
    c[i].d = (int)random(10, 50);
    c[i].v = (int)random(1, 10);
  }
}
 
void draw()
{
  background(135, 206, 250);
  for (int i=0; i<c.length; i++)
  {
    c[i].move();
    c[i].show();
  }
  for (int i=0; i<c.length; i++)
  {
    if (mousePressed)
    {
      c[i].x = mouseX + random(-40, 40);
      c[i].y = mouseY + random(0, 40);
    }
  }
}
 
class Celda
{
  float x, y;
  int d, v;
  int r ;
  int g ;
  int b ;
 
  void show()
  {
 
    fill(255,243,0);
    ellipse(x, y, d, d);
     
}
 
  void move()
  {
    x += ( mouseX - width/2  ) * 0.02 * v;
    y += ( mouseY - height/2 ) * 0.02 * v;
    x=x+random(10, 20);
    y=y+random(10, 20);
    if (x < -5)
    {
      x = 470;
    }
    if (x > 470)
    {
      x = 0;
    }
    if (y < -5)
    {
      y = 470;
    }
    if (y > 470)
    {
      y = 0;
    }
  }
}
void keyPressed()
{
 
    for (int i=0; i<100; i++)
    {
      c[i].d=c[i].d-1;
    }
}



