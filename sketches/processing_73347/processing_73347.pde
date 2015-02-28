
//Bozhong H. Rotating Cube, CP1 mods 14-15
int a=200;
int b=100;
int c=0;
int x=400;
int y=200;
int z=0;
float rot=random(-3,3);
float mot=random(-3,3);
void setup()
{
  size(800, 400, P3D);
  lights();
  frameRate(30);
}
void draw()
{
  pacman();
  ghost();
}
void pacman()
{
  background(0);
  stroke(246, 255, 100);
  translate(x, y, z);
  sphere(30);
  translate(-x, -y, -z);
  z=z+int(random(-30, 30));
  x=x+int(random(-30, 30));
  y=y+int(random(-30, 30));
  if (x>800 || x<0)
  {
    x=400;
  }
  if (y>400 || y<0)
  {
    y=200;
  }
  if (z>30)
  {
    z=0;
  }
}
void ghost()
{
  stroke(255);
  fill(100, 255, 255, 127);
  translate(a, b, c);
  rotateX(rot);
  rotateY(mot);
  rotateZ(.2);
  box(60);
  rotateZ(-.2);
  rotateY(-mot);
  rotateX(-rot);
  translate(-a, -b, -c);
  rot=rot+.05;
  if (a<x)
  {
    a=a+int(random(-5, 10));
  }
  else
  {
    a=a-int(random(-5, 10));
  }
  if (b<y)
  {
    b=b+int(random(-5, 10));
  }
  else
  {
    b=b-int(random(-5, 10));
  }
  if (c<z)
  {
    c=c+int(random(-5, 10));
  }
  else
  {
    c=c-int(random(-5, 10));
  }
}
