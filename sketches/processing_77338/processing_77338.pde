
// Abby Zhang mod 4/5 CP1

int x=1;
int y=1;
void setup()
{
  size(500,500);
  smooth();
  frameRate(2);
  textSize(100);
}
void draw()
{
  background(255,255,255);
  while(x<y)
  {
   ellipse(int(random(0,500)),int(random(0,500)),30,30);
    x++;
  }
 
  if (x>=y)
  {
    y=y*2;
  }
  if (x>600)
  {
    x=1;
    y=1;
  }
  fill(41,237,212);
  text(x/2,100,100);
}
