
Sphere [] Group;
int x=2;
void setup()
{
  size(600, 600, P3D);
  background(0);
  smooth();
  frameRate(10);
  Group=new Sphere[10];
  for (int i=0; i<Group.length; i++)
  {
    Group[i]=new Sphere();
  }
}

void draw()
{
  translate(0, 0, 0);
  noStroke();
  fill(100);
  lights();
  for (int i=0; i<Group.length; i++)
  {
    Group[i].show();
  }
  if(mousePressed==true)
  {
  camera(mouseX, mouseY, (float)(height/2), (float)(width/2), (float)(height/2), (float)0, (float)0, (float)1, (float)0);
  }
}

class Sphere
{
  int size, Color;
  Sphere()
  {
    size=(int)(Math.random()*50);
    Color=color((int)(Math.random()*255), (int)(Math.random()*100), (int)(Math.random()*100));
  }
  public void show()
  {
    translate(0, 0, 0);
    fill(255, 50);
    translate((int)(Math.random()*width), (int)(Math.random()*height), (int)(Math.random()*100));
    sphere(size);
  }
}



