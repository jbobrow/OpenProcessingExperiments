
Abc[] a;
void setup()
{
  size(600,600);
  noStroke();
  smooth();
  background(255);
  
  a = new Abc[50];
  for(int i=0; i<50; i++)
  {
    a[i] = new Abc();
    a[i].s = 10;
    a[i].u = random(height);
    a[i].v = random(width);
    a[i].w = height/4;
    a[i].x = width/3;
    a[i].y = height/3;
    a[i].z = width/9;
    a[i].g = random(1,255);
  }
  /*a[1].u = height/5;
  a[1].v = width/5;
  a[2].u = height/3;
  a[2].v = width/3;
  a[3].u = height/4;
  a[3].v = width/4;*/
}

void draw()
{
  background(255);
  for(int i=0; i<a.length; i++)
  {
    a[i].show();
    a[i].move();
  }
}

class Abc
{
  float g,u,v,w,x,y,z;
  int s;
  void show()
  {
    fill(g);
    triangle(u,v,w,x,y,z);
  }
  void move()
  {
    x =  mouseX;// - width/2 ) * 0.01 * s;
    y =  mouseY;// - height/2 ) * 0.01 * s;
  }
}

