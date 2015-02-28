
ball[] b;
 
void setup()
{
  size(800, 600);
  noStroke();
  smooth();
 
  b= new ball[200];
  for (int i=0; i<200; i++)
  {
    b[i]=new ball();
    b[i].x=round(random(800));
    b[i].y=round(random(600));
    b[i].m1=round(random(8));
    b[i].m2=round(random(7));
    if (b[i].m1==0)
    {
      b[i].m1=random(-6, -1);
    }
    if (b[i].m1==1)
    {
      b[i].m1=random(1, 8);
    }
    if (b[i].m2==0)
    {
      b[i].m2=random(-3, -1);
    }
    if (b[i].m2==1)
    {
      b[i].m1=random(1, 3);
    }
  }
}
 
void draw()
{
  
 
  for (int i=0; i<200; i++)
  {
    b[i].show();
    b[i].bounce();
  }
 
}
 
class ball
{
  float x, y, m1, m2;
 
  void show()
  {
    //fill(0,255,0);
    fill(random (255), random (0), random (0));
    ellipse(x, y, 50, 50);
    fill (random (0), random (0), random (0));
    ellipse(x, y, 40, 40);
    fill(255);
    ellipse (x,y, 20, 20);
    fill(0);
    ellipse (x,y,5,5);
  }
 
  void bounce()
  {
 
 
    x=x+m1;
    y=y+m2;
 
    if (x<=mouseX+18 && x>=mouseX && y>=mouseY-5 && y<=mouseY)
    {
      m1=random(1, 3);
      m2=random(-3, -1);
    }
    if (x<=mouseX+18 && x>=mouseX && y<=mouseY+25 && y>=mouseY)
    {
      m1=random(1, 3);
      m2=random(1, 3);
    }
 
    if (x>=mouseX-5 && x<=mouseX && y<=mouseY+25 && y>=mouseY)
    {
      m1=random(-3, -1);
      m2=random(-3, -1);
    }
    if (x>=mouseX-5 && x<=mouseX && y>=mouseY-5 && y<=mouseY)
    {
      m1=random(-3, -1);
      m2=random(1, 3);
    }
    if (x>795)
    {
      m1=random(-3, -1);
    }
    if (x<5)
    {
      m1=random(1, 3);
    }
    if (y>595)
    {
      m2=random(-3, -1);
    }
    if (y<5)
    {
      m2=random(1, 3);
    }
  }
}

