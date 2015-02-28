

PImage b;
int x=95;
int y=50;
void setup()
{
  background(255);
size(500,500);
b = loadImage("penguin-clipart-12[1].jpg");
}
void draw()
{
  int r=int (random(4));
if (mousePressed==true)
 {
     background(255);
  if (r==1)
  {
  image(b, x+15, y,300,350);
  }
  if (r==2)
  {
  image(b, x, y+15,300,350);
  }
  if (r==3)
  {
  image(b, x, y-15,300,350);
  }
  if (r==0)
  {
  image(b, x-15, y,300,350);
  }
 }
}


