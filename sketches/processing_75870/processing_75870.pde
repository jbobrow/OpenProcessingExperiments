
int x = 1;
int y = 1;
void setup()
{
  size(400,400);
}
void draw()
{
  frameRate(1);
  while(x<y)
  {
  ellipse(int(random(400)),int(random(400)),30,30);
  fill(random(200),random(200),random(200));
  x++;
  }
  if (x>=y)
  {
    y=y*2;
  }
  if (x==16385)
  {
    x=1;
    y=1;
  }  
  textSize(175);
  text(y/2,75,75);
}
