
int s = 5;
cercle[] a;
 
void setup ()
{
  size (400, 400);
  
  smooth();
  noStroke();
  a = new cercle[36];
 
  for (int i = 0; i < a.length; i++)
  {
    a[i] =new cercle();
    a[i].x = 10*i;
    a[i].y = 180;
    a[i].angle2 = 5;
    a[i].r = 20;
    a[i].angle = 10*i;
  }
}
 
void draw ()
{
  background (0, 255, 255);
  for (int i = 0; i < a.length; i++)
  {
    a[i].moviment();
    a[i].show();
  }
}
 
 
class cercle
{
  float x, y, r;
  float angle, angle2;
 
  void moviment()
  {
    angle += angle2;
  }
 
  void show()
  {
    y = s*30*sin(radians(angle+angle2)) + s *36;
    fill (random (255));
    ellipse (x, y, r*2, r*2);
  }
}


