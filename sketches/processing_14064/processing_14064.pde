
/*
Dot Dot Dot
by David Y.
10-14-10
*/
Dot[] a;
void setup()
{
  size(500,500);
  background(255);
  smooth();
  noStroke();
  a = new Dot[50];
  for(int i = 0; i < a.length; i++)
  {
    a[i] = new Dot();
    a[i].x = random(0,width*2);
    a[i].y = random(0,height*2);
    a[i].v = 2;
  }
}

void draw()
{
  background(255);
  for(int i=0; i<a.length; i++)
  {
    a[i].move();
    a[i].show();
    a[i].push(a);
  }
}

class Dot
{
  float x,y;
  float v;

  void show()
  {
    fill(0);
    ellipse(x,y,5,5);
  }
  
  void move()
  {
    x += v;
    y += -v;
    
    if(x > width)
    {
      x = x-width;
    }
    
    if(y < 0)
    {
      y = y+height;
    }
  }
  
  void push(Dot[] neighbors)
  {
    for(Dot n : neighbors)
    {
      if(n != this)
      {
        if(dist(x,y, n.x,n.y) < 50)
        {
          x += random(1,5);
          y += random(-1,-5);
        }
      }
    }
  }     
}

