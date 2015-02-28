
PImage b;
int xx=25;
int yy=50;
void setup()
{
size(500,500);
background(255,255,255);
b = loadImage("bug.jpg");
}
void draw()
{
background(255,255,255);
image(b, xx,yy,350,415);
if(mousePressed)
{
xx=xx+int(random(-8,8));
yy=yy+int(random(-2,2));
  }
}



