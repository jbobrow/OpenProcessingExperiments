
int x;
int y;

void setup()
{
   size(1000,1000);
   x=1000;
   y=1000;
  size (1000,1000);
  fill (20,20,255);
  ellipse (75,40,50,50);
  fill (250,0,0,100);
  rect (50,50,50,50);
}

void draw()
{
  x = x + 5;
  if (x > 500)
  {
    x=0;
    y=0;
  }
  fill (random(250),(random(250)),(random(250)));
  ellipse (mouseX,mouseY,50,100);
  fill (random(250),(random(250)),(random(250)));
  ellipse (mouseX,mouseY,120,100);
  fill (random(2),(random(1)),(random(-1)));
  ellipse (mouseX,mouseY,random(120),100);
}
void mousePressed()
{
  fill (252,252,252);
  rect (0,0,1000,1000);
  
}
void myVoid()
{
  
}

