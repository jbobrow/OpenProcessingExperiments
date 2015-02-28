
int x=1;
int y=5;
int que=0;
int change=15;

void setup()
{
  size(600, 500);
  background(0);
  noFill();
  stroke(200, 200, 210);
}
void draw()
{
  frameRate(500);

  eli();
    two();
}
void two()
{
  stroke(255, 210, 156,157-20*x);
  bezier(-x, 0, 120, x, 25, x, x+4, 500);
  stroke(221, 255, 128, 157+20*x);
  bezier(x, 0, 120, 100, 25, 355, x+4, 500);
  x=x+5;
  
  if(x>1006)
  {
    fill(50,20,10,3);
    ellipse(450,250,x,que+45);
    frameRate(1000);
    x=-5;
    
    que=que+20;
  }
}
void eli()
{
stroke(222,255,123);
  ellipse(y, 50, 10, y);
  y = y + change;
  if (y>800)
  {
   stroke(255);
    change=-change;
  }
  if (y<-1)
  {
    change=change+20;
  }
}
