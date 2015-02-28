
float x=20;
float y=20;
float z=49;
float b=2;
float n=5;
float m=4;
float l=0;
void setup()
{
  size(600, 600, P3D);
}
void draw()
{ 

  frameRate(29);
  background(0);
  
  sphere(50);
  fill(300, y+62, z-85, 160);
  lights();
  pointLight(114, 56, 74, 156, 156, 45);
  translate(124, y, 035);
  box(100);
  fill(x-300, y-62, x-85, 190);
  translate(-124, -y, -35);
  translate(x, y, 50);
  rotateX(x-10);
  rotateY(y-55);
  rotateZ(z+16.9);
  box(110);

  y=y+b;
  x=x+n;
  z=x+m;
 
  if (x>600)
  {
    n=-7;
    b=random(-8, 8);
  }
  if (y>600)
  {
    b=-8;
  }
  if (y<0)
  {
    b=4;
  }
  if (x<0)
  {
    n=8;
    b=random(-8, 8);
  }
  if (m>300)
  {
    m=random(-8, 2);
  }
}
