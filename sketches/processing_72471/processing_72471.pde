
PImage img;
int x=30;
int x1=200;
void setup ()
{
  size (300,300);
  img=loadImage ("http://meowkk.webs.com/thiscat.jpg");
}

void draw ()
{
  noStroke ();
  fill (37,158,216);
  rect (0,0,300,300);
  image (img,x,30);
  x=x+int(random (-10,10));
  if (x>260)
  {
    x=150;
  }
  if (x<0)
  {
    x=150;
  }
  rectangle ();
  sun ();
  ball ();
}


void rectangle ()
{
  fill (89,144,31);
  rect (0,190,300,110);
}

void sun()
{
  fill (216,196,37);
  ellipse (0,0,100,100);
}

void ball()
{
  fill (255,0,0);
  ellipse (x1,220,40,40);
  x1=x1+int (random (-10,10));
  if (x1>260)
  {
    x1=150;
  }
  if (x1<25)
  {
    x1=150;
  }
}
