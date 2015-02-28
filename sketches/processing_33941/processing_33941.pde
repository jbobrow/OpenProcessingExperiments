
int a = 100;
int b = 0;
int c = 100;
int d = 200;
int e = 100;
int f = 400;

void setup()
{
  size(700,400);
  background (255);
}
void draw()
{
  
  line(a,b,c,d);
  line(c,d,e,f);
}

void mousePressed()
{
  c = mouseX;
  d = mouseY;
}

void mouseDragged()
{
  c = mouseX;
  d = mouseY;
}


